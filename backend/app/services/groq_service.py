"""
AI Health Assistant service.

This is the piece that used to run on-device with the Groq API key bundled
into the app. It now lives here so the key never ships in the APK, and so
the assistant's context is grounded in the user's actual Medical ID data
pulled from Firestore server-side (the client can't spoof or inflate it).
"""
import logging

from groq import Groq

from app.config import get_settings
from app.models import ChatMessage
from app.firebase_client import get_db

logger = logging.getLogger("medsos.groq")

_client: Groq | None = None

SYSTEM_PROMPT_BASE = """You are the MedSOS AI Health Assistant, built for elderly and \
visually impaired users. Your job is to give clear, calm, plain-language guidance.

Rules you must always follow:
- You are not a doctor. Never diagnose. Never prescribe or recommend specific drug \
dosages.
- If the user describes symptoms that could be a medical emergency (chest pain, \
severe bleeding, difficulty breathing, stroke symptoms, loss of consciousness, \
suicidal thoughts), your first priority is telling them to contact emergency \
services or use the app's SOS button immediately.
- Keep responses short, simple, and reassuring. Avoid jargon. This app is used by \
people with limited vision and reads responses aloud via screen reader, so avoid \
formatting like bullet points, asterisks, or headers — use plain sentences.
- If the user's Medical ID data is provided below, take it into account (e.g. known \
allergies or conditions) but do not recite it back unprompted.
"""


def _get_client() -> Groq:
    global _client
    if _client is None:
        settings = get_settings()
        if not settings.groq_api_key:
            raise RuntimeError("GROQ_API_KEY is not configured on the server.")
        _client = Groq(api_key=settings.groq_api_key)
    return _client


def _fetch_medical_id_context(uid: str) -> str | None:
    db = get_db()
    if db is None:
        return None
    doc = db.collection("medical_ids").document(uid).get()
    if not doc.exists:
        return None
    data = doc.to_dict() or {}
    parts = []
    if data.get("blood_type"):
        parts.append(f"Blood type: {data['blood_type']}.")
    if data.get("allergies"):
        parts.append(f"Known allergies: {', '.join(data['allergies'])}.")
    if data.get("conditions"):
        parts.append(f"Known conditions: {', '.join(data['conditions'])}.")
    if data.get("medications"):
        parts.append(f"Current medications: {', '.join(data['medications'])}.")
    return " ".join(parts) if parts else None


def generate_reply(uid: str, message: str, history: list[ChatMessage]) -> tuple[str, bool]:
    """
    Returns (reply_text, was_grounded_in_medical_id).
    """
    settings = get_settings()
    client = _get_client()

    medical_context = _fetch_medical_id_context(uid)
    system_prompt = SYSTEM_PROMPT_BASE
    grounded = False
    if medical_context:
        system_prompt += f"\n\nUser's Medical ID on file: {medical_context}"
        grounded = True

    messages = [{"role": "system", "content": system_prompt}]
    for turn in history[-10:]:
        messages.append({"role": turn.role, "content": turn.content})
    messages.append({"role": "user", "content": message})

    try:
        completion = client.chat.completions.create(
            model=settings.groq_model,
            messages=messages,
            temperature=0.4,
            max_tokens=500,
        )
    except Exception as exc:  # noqa: BLE001
        logger.error("Groq call failed: %s", exc)
        raise

    reply = completion.choices[0].message.content or ""
    return reply.strip(), grounded
