# Flask App — Docker & GitHub Actions Deployment on AWS EC2

A minimal Flask web application built for learning containerization with **Docker** and CI/CD automation using **GitHub Actions**, with deployment on **AWS EC2**.

![Python](https://img.shields.io/badge/Python-3.14-blue)
![Flask](https://img.shields.io/badge/Flask-3.1.1-green)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF)
![AWS EC2](https://img.shields.io/badge/AWS-EC2-FF9900)

## Features

- Responsive landing page with modern glassmorphism UI
- `/health` endpoint for application health checks
- Docker containerization for consistent deployment

## Tech Stack

| Component | Technology |
|-----------|------------|
| Framework | Flask 3.1.1 |
| Runtime   | Python 3.14 |
| Container | Docker (python-slim) |
| CI/CD     | GitHub Actions |
| Deploy    | AWS EC2 |

## Project Structure

```text
flask-app-ecs/
├── app.py                 # Flask app with routes
├── run.py                 # Entry point (host 0.0.0.0, port 80)
├── requirements.txt       # Python dependencies
├── templates/
│   └── index.html         # Landing page
└── Dockerfile             # Single-stage Docker build
```

## Quick Start

### Run locally

```bash
pip install -r requirements.txt
python run.py
```

App runs at **http://localhost:80**.

### Run with Docker

**Build:**

```bash
docker build -t flask-app .
docker run -p 80:80 flask-app
```

## Dockerfile Explained

### Simple (`Dockerfile`)

Single-stage build using `python:3.14-slim`. Straightforward — copies everything, installs dependencies, and runs the app. Good for development and learning.

## Endpoints

| Route     | Method | Description |
|-----------|--------|-------------|
| `/`       | GET    | Landing page |
| `/health` | GET    | Health check (returns `Server is up and running`) |

## Deploy to AWS EC2

High-level steps to deploy this app on EC2:

1. **Build and push Docker image** to Docker Hub.

2. **Connect to your EC2 instance** using SSH.

3. **Install Docker** on the EC2 instance.

4. **Pull and run the Docker image**:

   ```bash
   docker pull <dockerhub-username>/flask-app:latest

   docker run -d \
     --name flask-app \
     -p 80:80 \
     <dockerhub-username>/flask-app:latest
   ```

5. **Configure EC2 Security Group** — allow inbound traffic on port 80.

## Author

**Md Abdullah Al Mobin**

GitHub: [@Mobin24](https://github.com/Mobin24)
