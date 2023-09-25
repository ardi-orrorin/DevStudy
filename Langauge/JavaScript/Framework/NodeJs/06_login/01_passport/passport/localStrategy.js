const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const User = require('../models/User');

module.exports = () => {
    passport.use(new LocalStrategy({ // passport 미들웨어
        usernameField: 'id', 
        passwordField: 'password',
        passReqToCallback: false
    }, async (id, password, done) => {
        try {
            const exUser = await User.findOne({where: {userid: id}});
            console.log(exUser);
            if(exUser){
                const result = await bcrypt.compare(password, exUser.userpassword);
                if(result){
                    done(null, exUser); 
                }else{
                    done(null, false, {message: '비밀번호가 일치하지 않습니다.'});
                    // done(param1, param2, param3) 의 구조
                    // passport.authentiacate('loca', (param1, param2, param3)) 으로 전달된다.
                }
            }else{
                done(null, false, {message: '아이디를 찾을 수 없습니다.'});
            }
        } catch(err) {
            console.error(err);
            done(err)
        }
    }))
}