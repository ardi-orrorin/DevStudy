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

app.use(morgran('dev'));
app.use(express.json())
app.use(express.urlencoded({extended: false}));
app.use(cookieParser(process.env.COOKIE_SECRET));
app.use(cors({
    credentials: true,
    allowedHeaders: '*',
    methods: '*',
    origin: 'http://localhost:8002',
}))

app.use(session({
    resave: false,
    saveUninitialized:false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
        httpOnly: true,
        secure: false
    },
}));

app.use('/auth', authRouter);
app.use('/v1', tokenRouter);
app.use('/v2', tokenRouterV2);



app.use((req, res, next) => {
    const err = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
    err.status = 404;
    next(err);
})

app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.err = process.env.NODE_ENV !== 'production' ? err : {};
    res.status(err.status || 500);
    res.send('error');
})

app.listen(app.get('port'), () => {
    console.log(`${app.get('port')} 포트 사용 중`);
})



