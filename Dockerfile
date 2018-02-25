FROM node:8.9-alpine

RUN apk --update add tzdata \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && apk del tzdata

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# add npm package
COPY package.json /usr/src/app/package.json

# install node modules
RUN npm install --production

# copy code
COPY . /usr/src/app

EXPOSE 7001

CMD npm run start:docker
