import logging
from datetime import datetime, timezone

from fastapi import APIRouter, Depends, HTTPException, status

from app.auth import get_current_uid
from app.config import get_settings
from app.firebase_client import get_db
from app.models import PurchaseVerifyRequest, SubscriptionStatus
from app.services import play_billing

logger = logging.getLogger("medsos.subscription")
router = APIRouter(prefix="/subscription", tags=["Subscription"])


def _require_db():
    db = get_db()
    if db is None:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Database is not configured on the server.",
        )
    return db


@router.post("/verify", response_model=SubscriptionStatus)
async def verify_purchase(payload: PurchaseVerifyRequest, uid: str = Depends(get_current_uid)):
    settings = get_settings()
    if settings.subscription_id_list and payload.product_id not in settings.subscription_id_list:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Unrecognized product_id.",
        )

    try:
        result = play_billing.verify_subscription(payload.product_id, payload.purchase_token)
    except RuntimeError as exc:
        raise HTTPException(status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail=str(exc))
    except Exception:  # noqa: BLE001
        logger.exception("Play Billing verification failed for uid=%s", uid)
        raise HTTPException(
            status_code=status.HTTP_502_BAD_GATEWAY,
            detail="Could not verify purchase with Google Play. Please try again shortly.",
        )

    db = _require_db()
    db.collection("subscriptions").document(uid).set(
        {
            "product_id": result["product_id"],
            "is_active": result["is_active"],
            "expiry_time": result["expiry_time"],
            "auto_renewing": result["auto_renewing"],
            "in_grace_period": result["in_grace_period"],
            "raw_state": result["raw_state"],
            "purchase_token": payload.purchase_token,
            "verified_at": datetime.now(timezone.utc),
        },
        merge=True,
    )

    return SubscriptionStatus(
        is_active=result["is_active"],
        product_id=result["product_id"],
        expiry_time=result["expiry_time"],
        auto_renewing=result["auto_renewing"],
        in_grace_period=result["in_grace_period"],
    )


@router.get("/status", response_model=SubscriptionStatus)
async def get_status(uid: str = Depends(get_current_uid)):
    db = _require_db()
    doc = db.collection("subscriptions").document(uid).get()
    if not doc.exists:
        return SubscriptionStatus(is_active=False)

    data = doc.to_dict() or {}
    return SubscriptionStatus(
        is_active=data.get("is_active", False),
        product_id=data.get("product_id"),
        expiry_time=data.get("expiry_time"),
        auto_renewing=data.get("auto_renewing"),
        in_grace_period=data.get("in_grace_period", False),
    )
