import logging
from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.config import get_settings
from app.firebase_client import init_firebase, get_db
from app.routers import health_assistant, medical_id, insights, subscription

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("medsos.main")

settings = get_settings()


@asynccontextmanager
async def lifespan(_: FastAPI):
    init_firebase()
    logger.info("MedSOS backend starting up in '%s' environment.", settings.environment)
    yield


app = FastAPI(
    title="MedSOS Backend",
    description="Backend API for MedSOS: AI Health Assistant, Medical ID, "
                 "Smart Health Insights, and Google Play subscription verification.",
    version="1.0.0",
    lifespan=lifespan,
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.allowed_origin_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/", tags=["Health"])
async def root():
    return {"status": "ok", "service": "medsos-backend"}


@app.get("/debug/firestore", tags=["Health"])
async def debug_firestore():
    """Quick connectivity check — mirrors the ResQAI /debug/firestore pattern."""
    db = get_db()
    if db is None:
        return {"connected": False, "error": "Firebase not configured or failed to initialize."}
    try:
        list(db.collection("medical_ids").limit(1).stream())
        return {"connected": True, "error": None}
    except Exception as exc:  # noqa: BLE001
        return {"connected": False, "error": str(exc)}


app.include_router(health_assistant.router)
app.include_router(medical_id.router)
app.include_router(insights.router)
app.include_router(subscription.router)
