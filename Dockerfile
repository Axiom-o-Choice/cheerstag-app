# ---- Build stage ----
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# pass env if you use VITE_* build-time vars
# e.g., RUN VITE_API_URL=$VITE_API_URL npm run build
RUN npm run build

# ---- Runtime stage ----
FROM nginx:1.28.0-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
# COPY dist/ /usr/share/nginx/html/
COPY --from=build /app/dist /usr/share/nginx/html
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://127.0.0.1/ || exit 1
