const jwt = require('jsonwebtoken');
const User = require('../models/User');

exports.createToken = async (req, res) => {
    const {id} = req.body;
    
    try {
        const user = await User.findOne({where: {userid: id}}).then(user => user);
        if(!user){
            return res.status(401).json({
                code: 401,
                message: '등록되지 않은 도메인입니다. 먼저 도메인을 등록하세요.'
            });
        }

        console.log(user);
        const token = jwt.sign({
            id: user.userid
        }, process.env.JWT_SECRET, {
            expiresIn: '10m', // 유효기간 ms 단위로도 입력가능
            issuer: 'token' // 발급자
        });

        return res.json({
            code: 200,
            message: '토큰이 발급되었습니다.',
            token,
        })
    } catch(err) {
        console.error(err);
        return res.status(500).json({
            code: 500,
            message: '서버 에러',
        })
    }
}

exports.tokenTest = (req, res) => {
    res.json(res.locals.decoded.id);
}