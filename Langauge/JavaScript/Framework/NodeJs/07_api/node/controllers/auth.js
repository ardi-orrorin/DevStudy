const bcrypt = require('bcrypt');
const passport = require('passport');
const User = require('../models/User');

exports.join = async (req, res, next) => {
    const { id, password, email } = req.body;
    try{
        const exUser = User.findOne({where: {userid: id}})
        if(exUser){
            return res.redirect('/join?error=exist');
        }

        const hash = await bcrypt.hash(password, 15);

        await User.create({
            userid: id,
            userpassword: hash,
            useremail: email,
            authority: 0,
        })

        res.redirect('/');
    } catch(err) {
        return next(err);
    }
}

exports.login = async (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        if(err) {
            return next(err);
        }

        if(!user){
            return res.redirect(`/?error=${info.message}`);
        }

        return req.login(user, (err) => {
            if(err){
                return next(err);
            }
            return res.redirect('/');
        })
    })(req, res, next);
}


exports.logout = (req ,res) => {
    req.logout(()=> {
        res.redirect('/');
    });
}

