const passport = require('passport');
const local = require('./localStrategy');
const User = require('../models/User');

module.exports = () => {
    passport.serializeUser((user, done) => {
        console.log(user);
        done(null, user.id);
    });

    passport.deserializeUser((id, done) => {
        User.findOne({where: {userid: id}})
        .then(user => done(null, user))
        .catch(err => done(err));
    });

    local();
}