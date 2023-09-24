const Sequelize = require('sequelize');
const AlertSite = require('./alertSite');

const env = process.env.NODE_ENV || 'development'
const config = require(__dirname + '/../config/config')[env];
const db = {};

const sequelize = new Sequelize(config.database, config.username, config.password, config);

db.sequelize = sequelize;
db.AlertSite = AlertSite;

AlertSite.initiate(sequelize);
AlertSite.associate(db);

module.exports = db;
