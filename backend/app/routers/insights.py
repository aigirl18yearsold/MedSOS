from datetime import datetime, timezone

from fastapi import APIRouter, Depends, HTTPException, status

from app.auth import get_current_uid
from app.firebase_client import get_db
from app.models import InsightsResponse, MedicalIDData
from app.services.health_insights import generate_insights

router = APIRouter(prefix="/insights", tags=["Smart Health Insights"])


@router.get("", response_model=InsightsResponse)
async def get_insights(uid: str = Depends(get_current_uid)):
    db = get_db()
    if db is None:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Database is not configured on the server.",
        )

    doc = db.collection("medical_ids").document(uid).get()
    data = MedicalIDData(**doc.to_dict()) if doc.exists else MedicalIDData()

    insights = generate_insights(data)
    return InsightsResponse(generated_at=datetime.now(timezone.utc), insights=insights)
