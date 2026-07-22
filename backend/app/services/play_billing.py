"""
Server-side Google Play subscription verification.

This is the piece the Play Store review process actually expects for a
subscription app: the client (react-native-iap) reports a purchase token
after checkout, and this service independently re-verifies that token
against the Google Play Developer API before granting entitlement. Never
trust the client's "I paid" claim on its own.

Requires a Play Console service account with "View financial data" access
(Play Console > Setup > API access), granted access to Android Publisher API.
"""
import json
import logging
from datetime import datetime, timezone

from google.oauth2 import service_account
from googleapiclient.discovery import build

from app.config import get_settings

logger = logging.getLogger("medsos.play_billing")

SCOPES = ["https://www.googleapis.com/auth/androidpublisher"]

_service = None


def _load_credentials():
    settings = get_settings()
    if settings.google_play_credentials_json:
        info = json.loads(settings.google_play_credentials_json)
        return service_account.Credentials.from_service_account_info(info, scopes=SCOPES)
    if settings.google_play_credentials_path:
        return service_account.Credentials.from_service_account_file(
            settings.google_play_credentials_path, scopes=SCOPES
        )
    return None


def _get_service():
    global _service
    if _service is not None:
        return _service
    creds = _load_credentials()
    if creds is None:
        raise RuntimeError("Google Play billing credentials are not configured on the server.")
    _service = build("androidpublisher", "v3", credentials=creds, cache_discovery=False)
    return _service


def verify_subscription(product_id: str, purchase_token: str) -> dict:
    """
    Calls purchases.subscriptions.v2.get and returns a normalized dict:
    { is_active, expiry_time, auto_renewing, in_grace_period }

    Raises RuntimeError if credentials aren't configured; callers should
    catch this and surface a 503, not silently mark the user as subscribed.
    """
    settings = get_settings()
    service = _get_service()

    result = (
        service.purchases()
        .subscriptionsv2()
        .get(
            packageName=settings.google_play_package_name,
            token=purchase_token,
        )
        .execute()
    )

    state = result.get("subscriptionState", "")
    line_items = result.get("lineItems", [])
    expiry_time = None
    auto_renewing = None

    if line_items:
        item = line_items[0]
        expiry_str = item.get("expiryTime")
        if expiry_str:
            expiry_time = datetime.fromisoformat(expiry_str.replace("Z", "+00:00"))
        auto_renewing = "autoRenewingPlan" in item

    active_states = {"SUBSCRIPTION_STATE_ACTIVE", "SUBSCRIPTION_STATE_IN_GRACE_PERIOD"}
    is_active = state in active_states
    in_grace_period = state == "SUBSCRIPTION_STATE_IN_GRACE_PERIOD"

    if expiry_time and expiry_time < datetime.now(timezone.utc):
        is_active = False

    return {
        "is_active": is_active,
        "product_id": product_id,
        "expiry_time": expiry_time,
        "auto_renewing": auto_renewing,
        "in_grace_period": in_grace_period,
        "raw_state": state,
    }
