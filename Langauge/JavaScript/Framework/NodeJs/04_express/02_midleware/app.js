const express  = require('express');
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const dotenv = require('dotenv');
const path = require('path');


dotenv.config();
const app = express();
app.set('port', process.env.PORT || 3000);

app.use(morgan('dev')) // logger middleware

// 정적 파일들 제공하는 라우터 역할
// public 폴더가 /경로로 대체
app.use('/', express.static(path.join(__dirname, 'public'))); 


// body-parser
// req.body 객체로 만들어주는 미들웨어
// 폼데이터나 ajax 요청 데이터를 처리 한다.
// 다만, multipart 데이터는 처리 하지 못 한다.
// exporess 4.17.0 이후 부터 포함되었다.
// app.use(express.raw()); // 요청 본문이 버퍼 데이터 일 때
// app.use(express.text()); // 텍스트 데이터일 때
app.use(express.json()); 

// URL-encoded 주소 형식으로 데이터를 보내는 방식
// extended : true qs모듈 사용, false : node 모듈 사용
app.use(express.urlencoded({extended: false}));

// 쿠기를 검증하기 위해 사용하는 함수 생성/삭제는 해당하지 않는다.
app.use(cookieParser(process.env.COOKIE_SECRET));

// express-session 1.5 버전 이전에는ㄴ 배줙으로 cookie-parser를 사용하고 있어서 cookie-parser
// 미들우어보다 뒤에 위치해야 했지만, 이후에는 사용하지 않게 되어 순서에 상관없다.
app.use(session({
    resave: false, // 요청이 올 때 세션에 수정사항이 생기지 않더라도 세션을 다시 저장할 것인지
    saveUninitialized: false, // 세션을 저장할 내용이 없더라도 처음부터세션을 생성할 지 설정
    secret: process.env.COOKIE_SECRET, 
    cookie: {
        httpOnly: true, // 클라이언트에서 쿠키 확인 여부
        secure: false, // https 의 사용 여부에 따라 사용가능 여부
    },
    name: 'session-cookie'
}));


const multer = require('multer'); // multipart 데이터 사용시 미들웨어
const fs = require('fs');

const upload = multer({
    storage: multer.diskStorage({
        destination(req, file, done){ // 어디에 저장할 지
            try{
                fs.readdirSync('uploads')
            }catch (err) {
                console.log('uploads 폴더가 없어 uploads 폴더를 생성합니다.');
                fs.mkdirSync('uploads')
            }
            done(null, 'uploads/');
        },
        filename(req, file, done){ // 파일 이름
            const ext = path.extname(file.originalname);
            done(null, path.basename(file.originalname, ext) + Date.now() + ext);
        },
    }),
    limits: { fileSize : 100 * 1024 * 1024}, // 업로드 사이즈 byte 단위
})

// app.post('/upload', upload.single('image'), (req, res) => {  // name='image' input에 한 개의 파일 한개를 의미 
// app.post('/upload', upload.array('image'), (req, res) => { // name='image' input multiple 일 경우
//     console.log(req.file, req.body);
//     res.send('ok');
// });

// app.post('/upload', upload.fields([{name: 'image1'}, {name: 'image2'}]), (req, res) => { // input 여러개인 경우 multiple attr 지원
app.post('/upload', upload.none(), (req, res) => { // 모든 내용이  req.body()로 이동
    console.log(req.files, req.body);
    res.send('ok');
});

app.use((req, res, next) => { // 모든 요청에  대한 미들웨어
    console.log('middleware1 start');
    next(); // 다음 미들웨어로
    console.log('middleware1 end');
});

app.get('/', (req, res, next) => {
    console.log('get1 start');
    next();

    // res.locals 하나의 요청에 종속된 데이터, 다음 미들웨어로 전달할 수 있다. forward 방식
}, (req, res, next) => {
    throw new Error('에러 처리 미들웨어로 이동')
});

app.use((err, req, res, next) => {
    console.error('mid2 - err', err);
    res.status(500).send(err.message);
});

app.listen(app.get('port'), ()=>{
    console.log(app.get('port'), '사용중');
})


// use(mid1) -> get1 mid1 -> get1 mid2 -> use(mid2) -> use(mid1)