exports.isLoggedIn = (req, res, next) => {
    console.log(req.body);
    if(req.isAuthenticated()) {
        next();
    } else {
        res.status(403).send('로그인 필요');
    }
}

exports.isNotLoggedIn = (req, res, next) => {
    console.log('isNot start',req.body);
    if(!req.isAuthenticated()){
        next();
    } else {
        const mesasge = encodeURIComponent('로그인한 상태입니다.');
        res.redirect(`/?error=${mesasge}`);
    }
    console.log('isNot end',req.body);
}