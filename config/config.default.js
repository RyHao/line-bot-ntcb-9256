'use strict';
require('dotenv').config();

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = `${appInfo.name}_${process.env.SECRET_KEY}`;

  // add your config here
  config.middleware = [
    'robot',
  ];

  // middleware robot's configurations
  config.robot = {
    ua: [
      /curl/i,
      /Baiduspider/i,
    ],
  };

  return config;
};
