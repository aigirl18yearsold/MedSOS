# MedSOS Backend

FastAPI backend for MedSOS, built so the app can be safely published to the
Google Play Store — the Groq API key and Google Play billing credentials
now live on this server instead of inside the APK, and every subscription
claim from the client is independently re-verified against Google.

## Why this exists

The AI Health Assistant previously called Groq directly from the React
Native app, which means the API key would have shipped inside the APK for
anyone to extract. This backend proxies that call instead. It also handles:

- **AI Health Assistant** — Groq (Llama 3.3 70B) chat, grounded in the
  user's saved Medical ID data, with a safety-first system prompt and
  per-user rate limiting.
- **Medical ID** — stores/retrieves the user's medical info in Firestore.
- **Smart Health Insights** — rule-based insights generated from Medical ID
  data (not another LLM call, so nothing here can hallucinate a condition
  the user doesn't actually have).
- **Subscription verification** — server-side verification of
  `react-native-iap` purchase tokens against the Google Play Developer API,
  which the Play Store review process expects for subscription apps.

All routes except `/` and `/debug/firestore` require a Firebase Auth ID
token (`Authorization: Bearer <token>`), verified server-side.

## Project layout

```
app/
  main.py              FastAPI app, CORS, startup, route registration
  config.py             Settings loaded from environment variables
  auth.py                Firebase ID token verification dependency
  firebase_client.py     Firebase Admin SDK init (auth + Firestore)
  models.py               Pydantic request/response schemas
  routers/
    health_assistant.py   POST /assistant/chat
    medical_id.py          GET/PUT /medical-id
    insights.py             GET /insights
    subscription.py          POST /subscription/verify, GET /subscription/status
  services/
    groq_service.py         Groq API wrapper + Medical ID grounding
    health_insights.py      Deterministic insight rules
    play_billing.py          Google Play Developer API verification
    rate_limit.py             In-memory per-user sliding window limiter
tests/                    pytest suite (11 tests, no external services needed)
```

## Setup

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# fill in .env — see below
uvicorn app.main:app --reload
```

Visit `http://localhost:8000/docs` for interactive Swagger docs once it's
running.

### Environment variables

| Variable | Required for | Notes |
|---|---|---|
| `GROQ_API_KEY` | AI chat | From console.groq.com |
| `GROQ_MODEL` | AI chat | Defaults to `llama-3.3-70b-versatile` |
| `FIREBASE_CREDENTIALS_JSON` or `FIREBASE_CREDENTIALS_PATH` | Auth, Medical ID, Insights, Subscriptions | Firebase Console → Project Settings → Service Accounts → Generate new private key |
| `GOOGLE_PLAY_CREDENTIALS_JSON` or `GOOGLE_PLAY_CREDENTIALS_PATH` | Subscription verification | Play Console → Setup → API access → service account with "View financial data" |
| `GOOGLE_PLAY_PACKAGE_NAME` | Subscription verification | e.g. `com.yourcompany.medsos` |
| `GOOGLE_PLAY_SUBSCRIPTION_IDS` | Subscription verification | Comma-separated product IDs from Play Console |
| `AI_CHAT_RATE_LIMIT_PER_MINUTE` | AI chat | Defaults to 10 |
| `ALLOWED_ORIGINS` | CORS | Defaults to `*`; lock this down in production |

In production (Render, same as ResQAI), set these as environment variables
in the dashboard rather than committing a `.env` file. For the two
credential JSON blobs, paste the full service account JSON as a single-line
environment variable value.

## API reference

| Endpoint | Method | Auth | Purpose |
|---|---|---|---|
| `/` | GET | No | Health check |
| `/debug/firestore` | GET | No | Firestore connectivity check |
| `/assistant/chat` | POST | Yes | AI Health Assistant chat, grounded in Medical ID |
| `/medical-id` | GET | Yes | Fetch the current user's Medical ID |
| `/medical-id` | PUT | Yes | Create/update the current user's Medical ID |
| `/insights` | GET | Yes | Smart Health Insights derived from Medical ID |
| `/subscription/verify` | POST | Yes | Verify a Play Billing purchase token, store entitlement |
| `/subscription/status` | GET | Yes | Current cached subscription status |

### Example: chat request

```
POST /assistant/chat
Authorization: Bearer <firebase_id_token>
Content-Type: application/json

{
  "message": "I feel dizzy when I stand up",
  "history": []
}
```

### Example: verify a purchase (called right after react-native-iap checkout)

```
POST /subscription/verify
Authorization: Bearer <firebase_id_token>
Content-Type: application/json

{
  "product_id": "medsos_premium_monthly",
  "purchase_token": "<token from purchase result>"
}
```

## Firestore schema

- `medical_ids/{uid}` — full_name, date_of_birth, blood_type, allergies[],
  conditions[], medications[], emergency_contact_name,
  emergency_contact_phone, notes, updated_at
- `subscriptions/{uid}` — product_id, is_active, expiry_time,
  auto_renewing, in_grace_period, raw_state, purchase_token, verified_at

## Deploying to Render

Same pattern as the ResQAI backend:

1. Push this to a GitHub repo.
2. New → Web Service on Render, point at the repo.
3. Build command: `pip install -r requirements.txt`
4. Start command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
5. Add all the environment variables from the table above.

## Mobile app changes needed

Point `submitRescueRequest`-style API calls in the app's AI Health
Assistant screen and Subscription flow at this backend's `/assistant/chat`
and `/subscription/verify` endpoints instead of calling Groq or trusting a
local purchase result directly. Every request needs the signed-in user's
Firebase ID token attached as a Bearer token — grab it with
`auth.currentUser.getIdToken()` from the Firebase JS SDK before each call.

## Tests

```bash
python3 -m pytest tests/ -q
```

11 tests, all offline (no live Firebase/Groq/Play calls) — they check the
deterministic insight rules and that every protected route correctly
rejects unauthenticated requests.
