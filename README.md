# UMKM Copilot AI 🤖

> **AI Business Operating System for Indonesian MSMEs**

UMKM Copilot AI is an AI-powered business assistant designed to help Indonesian Micro, Small, and Medium Enterprises (MSMEs) manage transactions, generate business insights, create marketing content, and make data-driven decisions using Google's Gemini AI.

Rather than acting as a simple chatbot, UMKM Copilot AI is built using an **AI Agent Architecture**, where specialized agents collaborate with business workflows, analytics, and structured data stored in Supabase.

---

# 🚀 Key Features

### 💰 Transaction Management

* Record sales using natural language
* Store transactions in Supabase
* Manage products and business information

### 📊 Business Analytics

* Sales dashboard
* Revenue tracking
* Product performance
* Inventory insights
* Customer statistics

### 🤖 AI Business Assistant

Powered by Google Gemini.

The assistant can:

* Answer business questions
* Explain business performance
* Generate recommendations
* Summarize sales trends
* Help business owners make better decisions

### 📢 AI Marketing Assistant

Generate:

* Product captions
* Promotional posts
* Marketing ideas
* Call-to-action (CTA)
* Hashtags

### 📈 Business Insights

Generate AI-powered reports such as:

* Weekly sales summary
* Best-selling products
* Slow-moving products
* Revenue growth
* Business recommendations

### 🌎 Export Readiness

Help MSMEs prepare for export by generating:

* Product descriptions
* Export documentation assistance
* International marketing content

---

# 🏗 Architecture

The application follows an AI Agent architecture.

```text
User
   │
   ▼
Router Agent
   │
   ├───────────────┐
   │               │
Transaction     Marketing
Agent           Agent
   │               │
   ▼               ▼
Workflow       Workflow
   │               │
   ▼               ▼
Tools        Analytics
   │               │
   ▼               ▼
Repository ─────────┐
   │                │
   ▼                ▼
 Supabase      Business Context
                    │
                    ▼
              Gemini AI
                    │
                    ▼
                Response
```

Business calculations are performed by the application itself, while Gemini focuses on generating explanations, recommendations, and marketing content.

---

# 📁 Project Structure

```text
umkm-copilot-ai/
│
├── app.py
├── requirements.txt
├── pyproject.toml
├── README.md
├── .env.example
│
├── app/
│   ├── agents/
│   ├── workflows/
│   ├── tools/
│   ├── repositories/
│   ├── analytics/
│   ├── memory/
│   ├── llm/
│   ├── database/
│   ├── schemas/
│   ├── config/
│   └── utils/
│
├── pages/
├── prompts/
├── assets/
├── docs/
├── data/
├── storage/
├── tests/
└── scripts/
```

---

# 🛠 Technology Stack

| Layer         | Technology    |
| ------------- | ------------- |
| Frontend      | Streamlit     |
| AI Model      | Google Gemini |
| Database      | Supabase      |
| Validation    | Pydantic      |
| Data Analysis | Pandas        |
| Visualization | Plotly        |
| Logging       | Loguru        |
| Environment   | python-dotenv |
| Testing       | Pytest        |

---

# ⚙ Installation

Clone the repository.

```bash
git clone <repository-url>
cd umkm-copilot-ai
```

Create a virtual environment.

```bash
python -m venv .venv
```

Activate the environment.

Linux / macOS

```bash
source .venv/bin/activate
```

Windows

```bash
.venv\Scripts\activate
```

Install dependencies.

```bash
pip install -r requirements.txt
```

---

# 🔑 Environment Variables

Create a `.env` file.

```env
GEMINI_API_KEY=

SUPABASE_URL=

SUPABASE_KEY=

APP_ENV=development

APP_NAME=UMKM Copilot AI

LOG_LEVEL=INFO
```

---

# ▶ Running the Application

```bash
streamlit run app.py
```

---

# 🧪 Running Tests

```bash
pytest
```

---

# 📌 Development Roadmap

### Milestone A — Foundation

* Project structure
* Configuration
* Pydantic Schemas
* Logger
* Supabase Connection
* Gemini Client

### Milestone B — Data Layer

* Repository
* Transaction Tools
* CRUD
* Dashboard (Basic)

### Milestone C — AI Core

* Router Agent
* Transaction Agent
* Workflow
* Memory
* Prompt Loader

### Milestone D — Business Features

* Marketing Assistant
* Business Insights
* Analytics
* Export Readiness

### Milestone E — Finalization

* UI Polish
* Testing
* Deployment
* Documentation
* Video Demo

---

# 🎯 Project Goals

This project aims to demonstrate how Generative AI can support Indonesian MSMEs by combining:

* AI Agents
* Structured business data
* Business analytics
* Workflow orchestration
* Context-aware AI assistance

The objective is not only to answer user questions but also to assist business owners in making informed business decisions.

---

# 📄 License

This project is developed for educational purposes and AI application development challenges.
