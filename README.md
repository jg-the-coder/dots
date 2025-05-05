# Stellite: Yard Optimisation AI Engine

![Build](https://img.shields.io/github/actions/workflow/status/zentronis/stellite/ci.yml)
![License](https://img.shields.io/github/license/zentronis/stellite)
![Python](https://img.shields.io/badge/python-3.11-blue.svg)
![Status](https://img.shields.io/badge/status-alpha-orange)

---

## Folder Structure

zentronis/
└── stellite/
├── README.md
├── .env.example
├── docker-compose.yml
├── stellite/
│ ├── **init**.py
│ ├── api/
│ ├── scheduler/
│ ├── analytics/
│ └── config/
├── tests/
│ └── ...
└── requirements.txt

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Testing](#testing)

---

## Overview

Stellite is a decision-layer AI engine designed to reduce inefficiencies in semi-automated freight yards. It analyses real-time input from ground-level sensors and system state to produce actionable scheduling and routing logic. Stellite does not replace your existing control software — it adds predictive capability to it.

Core features:

- Real-time track assignment and shunting recommendations
- Load-based wear estimation on high-friction components
- Override interface with operator feedback capture
- Failover routines based on historical fault mapping

---

## Getting Started

### Prerequisites

- Python 3.11
- Docker
- Redis (>=6)
- Postgres (>=14)
- Access to yard control API (mock available for dev use)
- `make` utility for scripts

### Installation

```bash
git clone https://github.com/zentronis/stellite.git
cd stellite
cp .env.example .env
make build
make up
```

or without Docker:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Usage

To start the inference engine in live mode:

```bash
python -m stellite.api.main --mode=live
```

To start in simulation:

```bash
python -m stellite.api.main --mode=sim --input=data/sample_yard_state.json
```

For the web interface (admin override + status dashboard):

```bash
make dashboard
```

### Testing

Run the test suite using:

```bash
make test
```

or manually:

```bash
pytest tests/
```

To run with coverage:

```bash
pytest --cov=stellite tests/
```

> ⚠️ Stellite is currently in closed alpha. External deployments are not supported.

Let me know if you want to flesh out any code structure or add contributing guidelines.
