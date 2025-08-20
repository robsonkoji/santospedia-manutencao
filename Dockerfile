# Stage 1: instalar dependências
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Stage 2: build
FROM node:18-alpine AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Limite de memória para evitar travamento
ENV NODE_OPTIONS="--max_old_space_size=2048"

RUN npm run build

# Stage 3: runtime
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Opcional: reduzir log verbosity do nginx
RUN sed -i 's/access_log/#access_log/g' /etc/nginx/nginx.conf
