FROM node:8-alpine AS build-sage
LABEL maintainaner="Dat Nguyen" \
      email="hi@dat.works"

WORKDIR /usr/src/seamcariving
COPY ./searm_carving/package*.json ./
RUN npm install
COPY ./searm_carving .
RUN npm run build

# Production stage
FROM nginx:1.15.5-alpine AS production-stage
COPY --from=build-stage /usr/src/seamcariving/dist /usr/share/nginx/html