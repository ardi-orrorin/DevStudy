const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

const User = require('../models/User');

module.exports = () => {
    passport.use(new LocalStrategy({
            usernameField: 'id',
            passwordField: 'password',
            passReqToCallback: false // 인증 함수로 HTTP requestd  그대로 전달할 지 여부 결정   
        }, async(id, password, done) => {
            try{
                const exUser = await User.findOne({where: {userid: id}});
                if(exUser){
                    const result = await bcrypt.compare(password, exUser.userpassword);
                    if(result){
                        done(null, exUser);
                    }else{
                        done(null, false, {message: '비밀번호가 일치 하지 않습니다.'});
                    }
                } else {
                    done(null, false, {message: '계정을 찾을 수 없습니다.'})
                }

            } catch(err) {
                done(err);
            }
        })
    );
}
