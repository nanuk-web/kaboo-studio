# Build stage
FROM node:20-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# Runtime stage
FROM nginx:1.27-alpine

# Nginx listens on 8080 (unprivileged) for easy hosting.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Static output from Astro
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 8080

# Simple container healthcheck endpoint could be added later; default is fine.
