'use strict';

const Sequelize = require('sequelize');
const process = require('process');
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.js')[env];
const User = require('./User');
const db = {};


const sequelize = new Sequelize(config.database, config.username, config.password, config);



db.sequelize = sequelize;
db.User = User;

User.initiate(sequelize);
User.associate(db);

module.exports = db;
