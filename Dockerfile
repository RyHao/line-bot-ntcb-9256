FROM node:8.9-alpine

RUN apk --update add tzdata \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && apk del tzdata

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# copy code
COPY . /usr/src/app

EXPOSE 7001

CMD npm run start:docker
