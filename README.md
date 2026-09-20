# LGTM Platform

Production-grade observability stack on KinD using GitOps.

## Stack
- **Loki** — logs
- **Grafana** — dashboards
- **Tempo** — traces
- **Mimir** — long-term metrics
- **Alloy** — universal collector
- **Prometheus** — metrics scraping
- **Alertmanager** — alerts
- **K6** — load testing

## Prerequisites
- Docker
- kind
- kubectl
- helm
- argocd CLI

## Quick Start
```bash
bash bootstrap/install.sh
```
