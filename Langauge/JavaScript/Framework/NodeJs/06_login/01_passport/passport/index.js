const passport = require('passport');
const local = require('./localStrategy');
const User = require('../models/User');
// const kakao = require('./kakaoStrategy');

module.exports = () => {
    // 로그인 시 req.session 객체에 어떤 데이터를 저장할 지 정하는 메서드
    passport.serializeUser((user, done) => {
        console.log(user);
        done(null, user.id)
    });

    // 각 요청마다 실행되는 메서드로 passport.session 미들웨어가 이 메서드를 호출
    // serializeUser done()의 두번째 매개변수르 넣었던 데이터가 deserializeUser의
    // 매개변수가 된다.
    // 
    passport.deserializeUser((id, done) => {
        User.findOne({where: {userid: id}})
            .then(user => done(null, user))
            .catch(err => done(err));
    });

    local();
    // kakao();
}