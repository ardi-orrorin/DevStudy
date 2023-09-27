const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const passport = require('passport');
const morgran = require('morgan');
const session = require('express-session');
const nunjucks = require('nunjucks');
const dotenv = require('dotenv');
const passportConfig = require('./passport');
const authRouter = require('./routes/auth');
const tokenRouter = require('./routes/token');
const tokenRouterV2 = require('./routes/tokenv2');
const cors = require('cors');
const logger = require('./logger');
const helmet = require('helmet');
const hpp = require('hpp');


const { sequelize } = require('./models');



dotenv.config();

const app = express();
passportConfig();



app.set('port', process.env.PORT || 3000);

sequelize.sync({ force: false})
    .then(()=> {
        console.log('데이터베이스 연결 성공');
    })
    .catch((err)=>{
        console.log(err);
    })


app.use(express.json())
app.use(express.urlencoded({extended: false}));
app.use(cookieParser(process.env.COOKIE_SECRET));
app.use(cors({
    credentials: true,
    allowedHeaders: '*',
    methods: '*',
    origin: 'http://localhost:8002',
}))


const sessionOption = {
    resave: false,
    saveUninitialized:false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
        httpOnly: true,
        secure: false
    },
    // store: new RedisStore({}) // 레디스를 통한 세션 관리시
}

if(process.env.NODE_ENV === 'production'){ // 배포와 개발용 
    app.use(morgran('combined')); // 주로 배포 환경에서 사용

    sessionOption.proxy = true; // https 적용을 위해 앞에 서버를 둬야할 대 역방향 프록시 상황
    // sessionOption.cookie.secure = true //  https 적용 했을 때 사용
    app.use(helmet({
        contentSecurityPlicy: false,
        crossOriginEmbedderPolicy: false,
        crossOriginResourcePolicy: false,
    }));
    app.use(hpp());
}else {
    app.use(morgran('dev')); // 개발용
}
app.use(session(sessionOption));

app.use('/auth', authRouter);
app.use('/v1', tokenRouter);
app.use('/v2', tokenRouterV2);



app.use((req, res, next) => {
    const err = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
    err.status = 404;
    // logger.info('hello');
    // logger.error(err.message);
    next(err);
})

app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.err = process.env.NODE_ENV !== 'production' ? err : {};
    res.status(err.status || 500);
    res.send('error');
})

module.exports = app;

