const express = require('express');
const path = require('path');
const morgan = require('morgan');
const nunjucks = require('nunjucks');
const dotenv = require('dotenv');
const { sequelize } = require('./models');

const indexRouter = require('./routes');
// const alertRouter = require('./routes/alert');

dotenv.config();

const app = express();

app.set('port', process.env.SERVER_PORT || 3000);
app.set('view engine', 'html');

nunjucks.configure('views', {
    express: app,
    watch: true,
});

sequelize
    .sync({force: false})
    .then(()=>{
        console.log('데이터베이스가 연결되었습니다.');
    })
    .catch((err)=>{
        console.error(err);
        console.log('데이터베이스 연결에 실패해습니다.');
    });


app.use(morgan('dev'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.use('/', indexRouter);
// app.use('/alert', alertRouter);

app.use((req, res, next) => {
    const error = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
    error.status = 404;
    next(error); // err 미들웨어에 값 전달
});

app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.error = process.env.NODE_ENV !== 'production' ? err : {};
    res.status(err.status || 500);
    res.render('error');
});

app.listen(app.get('port'), () => {
    console.log(app.get('port'), '빈 포트에서 대기 중');
});



