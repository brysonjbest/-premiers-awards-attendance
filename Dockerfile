FROM docker.io/node:16.13.2-alpine

ENV NO_UPDATE_NOTIFIER=true
WORKDIR /opt/app-root/src/app
COPY . /opt/app-root/src
RUN npm run all:ci \
  && npm run all:build \
  && npm run frontend:purge 
EXPOSE 8000
CMD ["npm", "run", "start"]