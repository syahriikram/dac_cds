# docker build --build-arg NODE_VERSION=xxx -t <image> .
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
# this uses shell to start - support things like your ENV variables, pipes, redirects, etc!
ENTRYPOINT node main.js
# this uses the exec v (a C program that does not interpret a shell!)
# ENTRYPOINT [ "node", "main.js" ]

# docker run -d -p 8000:3000 --name app0 <image> abc xyz
# CMD [ "5000" ]  <--- will be added here!!!!!

