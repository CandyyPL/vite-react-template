ARG NODE_VERSION=24.14.0-alpine
ARG NGINX_VERSION=stable-alpine

FROM node:${NODE_VERSION} AS build
WORKDIR /app

#ARG VITE_CUSTOM_ENV_VAR
#ENV VITE_CUSTOM_ENV_VAR=${VITE_CUSTOM_ENV_VAR}

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:${NGINX_VERSION} AS run
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
