const bcrypt = require('bcrypt');
const passport = require('passport');
const User = require('../models/User');
const salt = process.env.SALT;

exports.join = async (req, res, next) => {
    
    const { id, password , email} = req.body;
    try {
        const exUser = await User.findOne({where: {userid: id}});
        console.log(exUser);
        if(exUser){
            return res.redirect('/join?error=exist');
        }
        
        // hash  두 번째 인수는 pbkdf2 의 반복 횟수
        // PPBKDF2(Password-Based Key Derivation Function Version2)
        // 미국 NIST에서 승인받은 사용자 패스워드를 Key 기반으로 유도를 하기 위한 함수
        // 패스워드에 햄시함수, 솔트(Salt), 반복 횟수 드을 지정하여 패스워드에 대한 Digest 생성하는 방식
        // Digest란? 비밀번호를 Slat로 암호화한 결과값
        const hash = await bcrypt.hash(password, 12); 

        await User.create({
            userid: id,
            userpassword: hash,
            useremail: email,
            authority: 0
        });

        return res.redirect('/');
    } catch(err) {
        console.error(err);
        return next(err);
    }
}

exports.login = async (req, res, next) => {
    passport.authenticate('local', (authError, user, info) => {
        console.log(authError, user, info);
        if(authError){
            console.error(authError);
            return next(authError);
        }
        if(!user){
            return res.redirect(`/?error=${info.message}`);
        }
        return req.login(user, (loginError) => {
            if(loginError) {
                console.error(loginError);
                return next(loginError);
            }
            return res.redirect('/');
        })
    })(req, res, next);
}

exports.logout = (req, res) => {
    req.logout(()=>{ //  req.user req.session 객체를 제거한다.
        res.redirect('/');
    });
}