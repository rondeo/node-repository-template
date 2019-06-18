FROM node:alpine
WORKDIR /app
COPY . .
RUN yarn install --production
ENTRYPOINT ["./entrypoint.sh"]
