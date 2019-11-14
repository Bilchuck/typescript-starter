# This image caches dependencies for other containers
# It allows to install them once and reuse later
FROM node:11-alpine

WORKDIR /usr/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile && yarn cache clean
COPY . .
CMD yarn start:debug
