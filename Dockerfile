# ── STAGE 1: build ──────────────────────────────
FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

# ── STAGE 2: runtime con Nginx ──────────────────
FROM nginx:alpine

RUN addgroup -S webgroup && adduser -S webuser -G webgroup

COPY --from=builder /app/html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
