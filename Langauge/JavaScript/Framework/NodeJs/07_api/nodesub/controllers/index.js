const axios = require('axios').default;

exports.test = async (req, res, next) => {
    try {
        if(!req.session.jwt){ // 세션에 토큰이 없으면 토큰 발급 시도
            const tokenResult = await axios.post('http://localhost:8000/v1/token', {
                id: '123' // 토큰 요청할 아이디
            });
            
            if(tokenResult.data.code === 200){
                req.session.jwt = tokenResult.data.token; // 세션에 토큰 저장
            } else {
                return res.json(tokenResult.data); // 발급 실패 반환
            }
        }

        // 발급 받은 토큰 테스트
        const result = await axios.get('http://localhost:8000/v1/test', {
            headers: { authorization: req.session.jwt}
        })
        
        return res.json(result.data);
    } catch(err) {
        console.error(err);
        if(err.response?.status === 419) { // 토큰 만료시
            return res.json(err.response.data);
        }
        return next(err);
    }
}