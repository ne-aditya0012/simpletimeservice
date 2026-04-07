# Particle41 Project Submission : Aditya Nimje
```json
{
  "message" : "Hello Particle41! I am Aditya Nimje.",
  "timestamp": "2025-04-07T10:30:00.123456+00:00",
  "ip": "203.0.113.42"
}
```

## Project structure

```
simpletimeservice/app/
├── app.py             # Flask application
├── requirements.txt   # Python dependencies
├── Dockerfile         # Multi-stage Docker build (non-root user)
├── .dockerignore
├── microservice.yml   # Kubernetes Deployment + Service
└── README.md
```
## Docker Image
You can use the following docker image.
```
adsne19/simpletimeservice:latest
```

## Deploy to Kubernetes

### 1. Apply the manifest

```bash
kubectl apply -f microservice.yml
```

This creates:
- a **Deployment** with 2 replicas using the public image `adsne19/simpletimeservice:latest`
- a **ClusterIP Service** on port 80 → container port 8080

### 2. Verify the pods are running

```bash
kubectl get pods -l app=simpletimeservice
kubectl get svc simpletimeservice
```

### 3. Test the service

The service used for this demo is ClusterIP, thus we will need to port forward the service to fetch the json.

```bash
kubectl port-forward svc/simpletimeservice 8080:80
```

Then in a separate terminal:

```bash
curl http://localhost:8080/
```

Expected response:

```json
{
  "message" : "Hello Particle41! I am Aditya Nimje",
  "ip": "127.0.0.1",
  "timestamp": "2025-04-07T10:30:00.123456+00:00"
}
```


### Image highlights

- **Base**: `python:3.12-alpine` — minimal footprint (~60 MB total)
- **Multi-stage build** — build tools are not present in the final image
- **Non-root user**: the container process runs as `appuser` (UID 1000), enforced both in the Dockerfile and in the Kubernetes `securityContext`
- **Production server**: [Gunicorn](https://gunicorn.org/) with 2 workers instead of Flask's development server

---


### Security notes

- The container runs as a non-root user (`runAsNonRoot: true`, `runAsUser: 1000`)
- All Linux capabilities are dropped (`capabilities.drop: [ALL]`)
- No secrets or API keys are present anywhere in this repository
