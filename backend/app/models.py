from datetime import datetime
from typing import Literal

from pydantic import BaseModel, Field


# ---------- AI Health Assistant ----------

class ChatMessage(BaseModel):
    role: Literal["user", "assistant"]
    content: str


class ChatRequest(BaseModel):
    message: str = Field(..., min_length=1, max_length=2000)
    history: list[ChatMessage] = Field(default_factory=list, max_length=20)


class ChatResponse(BaseModel):
    reply: str
    model: str
    grounded_in_medical_id: bool


# ---------- Medical ID ----------

class MedicalIDData(BaseModel):
    full_name: str | None = None
    date_of_birth: str | None = None  # ISO date string, e.g. "1958-03-12"
    blood_type: str | None = None
    allergies: list[str] = Field(default_factory=list)
    conditions: list[str] = Field(default_factory=list)
    medications: list[str] = Field(default_factory=list)
    emergency_contact_name: str | None = None
    emergency_contact_phone: str | None = None
    notes: str | None = None


class MedicalIDResponse(MedicalIDData):
    updated_at: datetime | None = None


# ---------- Smart Health Insights ----------

class InsightItem(BaseModel):
    title: str
    detail: str
    severity: Literal["info", "advisory", "attention"]


class InsightsResponse(BaseModel):
    generated_at: datetime
    insights: list[InsightItem]


# ---------- Subscription / Google Play Billing ----------

class PurchaseVerifyRequest(BaseModel):
    product_id: str
    purchase_token: str


class SubscriptionStatus(BaseModel):
    is_active: bool
    product_id: str | None = None
    expiry_time: datetime | None = None
    auto_renewing: bool | None = None
    in_grace_period: bool = False
