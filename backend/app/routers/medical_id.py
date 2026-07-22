import logging
from datetime import datetime, timezone

from fastapi import APIRouter, Depends, HTTPException, status

from app.auth import get_current_uid
from app.firebase_client import get_db
from app.models import MedicalIDData, MedicalIDResponse

logger = logging.getLogger("medsos.medical_id")
router = APIRouter(prefix="/medical-id", tags=["Medical ID"])


def _require_db():
    db = get_db()
    if db is None:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Database is not configured on the server.",
        )
    return db


@router.get("", response_model=MedicalIDResponse)
async def get_medical_id(uid: str = Depends(get_current_uid)):
    db = _require_db()
    doc = db.collection("medical_ids").document(uid).get()
    if not doc.exists:
        return MedicalIDResponse()
    return MedicalIDResponse(**doc.to_dict())


@router.put("", response_model=MedicalIDResponse)
async def upsert_medical_id(payload: MedicalIDData, uid: str = Depends(get_current_uid)):
    db = _require_db()
    record = payload.model_dump()
    record["updated_at"] = datetime.now(timezone.utc)
    db.collection("medical_ids").document(uid).set(record, merge=True)
    return MedicalIDResponse(**record)
