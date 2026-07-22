"""
Auth dependency shared by every protected route.

The mobile app signs the user in with Firebase Auth and attaches the
resulting ID token as `Authorization: Bearer <token>` on every request.
This dependency verifies that token server-side (never trusting a client-
supplied user id) and injects the verified Firebase uid into the route.
"""
from fastapi import Header, HTTPException, status

from app.firebase_client import verify_id_token


async def get_current_uid(authorization: str = Header(default="")) -> str:
    if not authorization.startswith("Bearer "):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Missing or malformed Authorization header. Expected 'Bearer <firebase_id_token>'.",
        )

    id_token = authorization.removeprefix("Bearer ").strip()
    decoded = verify_id_token(id_token)

    if decoded is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid or expired authentication token.",
        )

    uid = decoded.get("uid")
    if not uid:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Token missing uid.")

    return uid
