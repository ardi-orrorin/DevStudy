const app = require('./app');

app.listen(app.get('port'), () => {
    console.log(`${app.get('port')} 포트 사용 중`);
})