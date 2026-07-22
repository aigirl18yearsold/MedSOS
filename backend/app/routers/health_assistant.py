import logging

from fastapi import APIRouter, Depends, HTTPException, status

from app.auth import get_current_uid
from app.models import ChatRequest, ChatResponse
from app.services import groq_service
from app.services.rate_limit import check_rate_limit
from app.config import get_settings

logger = logging.getLogger("medsos.health_assistant")
router = APIRouter(prefix="/assistant", tags=["AI Health Assistant"])


@router.post("/chat", response_model=ChatResponse)
async def chat(payload: ChatRequest, uid: str = Depends(get_current_uid)):
    check_rate_limit(uid, bucket="ai_chat")

    settings = get_settings()
    try:
        reply, grounded = groq_service.generate_reply(uid, payload.message, payload.history)
    except RuntimeError as exc:
        raise HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail=str(exc))
    except Exception:  # noqa: BLE001
        logger.exception("AI Health Assistant call failed for uid=%s", uid)
        raise HTTPException(
            status_code=status.HTTP_502_BAD_GATEWAY,
            detail="The AI Health Assistant is temporarily unavailable. Please try again.",
        )

    return ChatResponse(reply=reply, model=settings.groq_model, grounded_in_medical_id=grounded)
