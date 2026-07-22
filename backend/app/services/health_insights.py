"""
Smart Health Insights.

Deliberately rule-based rather than another free-floating LLM call: each
insight is grounded in a specific field the user actually entered in their
Medical ID, so nothing here can hallucinate a condition they don't have.
This mirrors the "explainable, grounded" pattern used in ResQAI's assistant
module — the output is traceable back to real input data.
"""
from datetime import date, datetime

from app.models import InsightItem, MedicalIDData


def _age_from_dob(dob_str: str | None) -> int | None:
    if not dob_str:
        return None
    try:
        dob = datetime.strptime(dob_str, "%Y-%m-%d").date()
    except ValueError:
        return None
    today = date.today()
    return today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))


def generate_insights(data: MedicalIDData) -> list[InsightItem]:
    insights: list[InsightItem] = []

    age = _age_from_dob(data.date_of_birth)
    if age is not None and age >= 65:
        insights.append(
            InsightItem(
                title="Annual check-up reminder",
                detail="Based on your Medical ID, you're due for a yearly wellness visit "
                       "if you haven't had one in the last 12 months.",
                severity="info",
            )
        )

    if not data.emergency_contact_phone:
        insights.append(
            InsightItem(
                title="No emergency contact on file",
                detail="Add an emergency contact number in Medical ID so responders can "
                       "reach someone on your behalf during an SOS.",
                severity="attention",
            )
        )

    if not data.blood_type:
        insights.append(
            InsightItem(
                title="Blood type missing",
                detail="Adding your blood type to Medical ID helps first responders in an "
                       "emergency.",
                severity="advisory",
            )
        )

    if len(data.medications) >= 5:
        insights.append(
            InsightItem(
                title="Multiple medications on file",
                detail=f"You have {len(data.medications)} medications listed. Consider "
                       "reviewing them with your doctor or pharmacist for interactions.",
                severity="advisory",
            )
        )

    if data.allergies:
        insights.append(
            InsightItem(
                title="Allergy information saved",
                detail=f"{len(data.allergies)} allerg{'y is' if len(data.allergies) == 1 else 'ies are'} "
                       "on file and will be shown to responders during an SOS.",
                severity="info",
            )
        )

    if not insights:
        insights.append(
            InsightItem(
                title="Medical ID looks complete",
                detail="No immediate gaps found in your Medical ID. Keep it updated after "
                       "any doctor visits.",
                severity="info",
            )
        )

    return insights
