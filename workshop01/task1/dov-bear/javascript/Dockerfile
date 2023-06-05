ARG NODE_VERSION=20

FROM node:${NODE_VERSION}

# create /app and cd in to /app
WORKDIR /app

# copy app files and directories into /app
COPY package.json .
COPY package-lock.json .
COPY main.js .
COPY public public
COPY views views

RUN npm ci

# setup environment variable for the application!
ENV APP_PORT=3000

# what port to bind to
EXPOSE ${APP_PORT}

# healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl http://localhost:${APP_PORT}/health

# starting point of the program
ENTRYPOINT node main.js

