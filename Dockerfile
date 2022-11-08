FROM node:16.17.0-bullseye-slim
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
ENV NODE_ENV production
WORKDIR /public
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3700
USER node
CMD [ "dumb-init", "node", "index.js" ]