"""
Minimal in-memory sliding-window rate limiter.

Good enough for a single Render instance protecting Groq spend. If you ever
scale to multiple instances, swap this for a Redis-backed limiter — the
call site (`check_rate_limit`) won't need to change.
"""
import time
from collections import defaultdict

from fastapi import HTTPException, status

from app.config import get_settings

_calls: dict[str, list[float]] = defaultdict(list)


def check_rate_limit(uid: str, bucket: str = "ai_chat") -> None:
    settings = get_settings()
    limit = settings.ai_chat_rate_limit_per_minute
    window_seconds = 60.0
    key = f"{bucket}:{uid}"
    now = time.monotonic()

    timestamps = _calls[key]
    # Drop anything outside the sliding window
    while timestamps and now - timestamps[0] > window_seconds:
        timestamps.pop(0)

    if len(timestamps) >= limit:
        raise HTTPException(
            status_code=status.HTTP_429_TOO_MANY_REQUESTS,
            detail=f"Rate limit exceeded: {limit} requests per minute. Please slow down.",
        )

    timestamps.append(now)
