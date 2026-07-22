"""
Firebase connection layer.

Same defensive pattern used in the ResQAI backend: if no credentials are
configured, everything here falls back to None/no-ops instead of crashing
the app on startup. That lets the server boot (and /health respond) even
before Firebase is wired up, and makes local dev without credentials
possible.
"""
import json
import logging

import firebase_admin
from firebase_admin import credentials, auth as fb_auth, firestore

from app.config import get_settings

logger = logging.getLogger("medsos.firebase")

_app = None
_db = None


def _load_credentials():
    settings = get_settings()
    if settings.firebase_credentials_json:
        info = json.loads(settings.firebase_credentials_json)
        return credentials.Certificate(info)
    if settings.firebase_credentials_path:
        return credentials.Certificate(settings.firebase_credentials_path)
    return None


def init_firebase():
    global _app, _db
    if _app is not None:
        return _app

    cred = _load_credentials()
    if cred is None:
        logger.warning("No Firebase credentials configured — auth and Firestore are disabled.")
        return None

    try:
        _app = firebase_admin.initialize_app(cred)
        _db = firestore.client()
        logger.info("Firebase initialized successfully.")
    except Exception as exc:  # noqa: BLE001
        logger.error("Firebase initialization failed: %s", exc)
        _app = None
        _db = None

    return _app


def get_db():
    """Returns a Firestore client, initializing Firebase on first use."""
    if _app is None:
        init_firebase()
    return _db


def verify_id_token(id_token: str) -> dict | None:
    """
    Verifies a Firebase Auth ID token sent from the mobile app.
    Returns the decoded token (contains 'uid', 'email', etc.) or None if
    invalid / Firebase is not configured.
    """
    if _app is None:
        init_firebase()
    if _app is None:
        return None
    try:
        return fb_auth.verify_id_token(id_token)
    except Exception as exc:  # noqa: BLE001
        logger.info("ID token verification failed: %s", exc)
        return None
