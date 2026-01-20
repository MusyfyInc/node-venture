# incorp-partner-model-node

This is your original **Vite + React** project converted into a **Node.js application** by adding an **Express** server that serves the built SPA (`dist/`).

## Local run (production-like)

```bash
npm install
npm run build
npm start
```

- Default port: `8080`
- Override: `PORT=9090 npm start`

## Local development (Vite dev server)

```bash
npm install
npm run dev
```

## Docker / Cloud Run

This repo includes a Node-based multi-stage `Dockerfile` that:
1) Installs dependencies + builds the Vite app
2) Runs a small Node/Express server to serve `dist/`

Build and run:

```bash
docker build -t incorp-node-app .
docker run -p 8080:8080 -e PORT=8080 incorp-node-app
```

Deploy to Cloud Run (example):

```bash
gcloud run deploy incorp-node-app \
  --source . \
  --region us-central1 \
  --allow-unauthenticated
```
