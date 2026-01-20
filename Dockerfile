# --- builder ---
FROM node:20-slim AS builder
WORKDIR /app

COPY package*.json ./

# install only prod deps (as you want)
RUN npm ci --omit=dev

# install vite ONLY for build, without touching package.json
RUN npm install --no-save vite

COPY . .

# IMPORTANT: call vite via npx, not via "vite" binary
RUN npx vite build

# --- runtime ---
FROM node:20-slim AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=8080

COPY package*.json ./
RUN npm ci --omit=dev

COPY server.js ./
COPY --from=builder /app/dist ./dist

EXPOSE 8080
CMD ["npm", "start"]
