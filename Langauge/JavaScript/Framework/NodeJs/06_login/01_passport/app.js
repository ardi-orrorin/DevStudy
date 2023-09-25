const dotenv = require('dotenv');
const passport = require('passport');
const passportConfig = require('./passport');
const express = require('express');
const app = express();
const session = require('express-session');
const {sequelize} = require('./models');
const morgan = require('morgan');
const authRouter = require('./routes/auth');

dotenv.config();
passportConfig();

app.set('port', process.env.PORT || 8000);

sequelize.sync({force: false})
    .then(()=>{console.log('데이터 베이스 연결')})
    .catch((err)=>{console.error(err);});

app.set('view engine', 'html');

app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(session({
    resave: false,
    saveUninitialized: false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
        httpOnly: true,
        secure: false
    }
}));

app.use(passport.initialize());
app.use(passport.session());


// const pageRouter = require('./routes/page')

app.use('/auth', authRouter);

app.listen(app.get('port'), ()=>{
    console.log(app.get('port'), '서버 포트 사용중...');
})