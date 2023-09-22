// path
// windows c:\ \으로 구분
// posix unix계절 /home/ /로 구분

const path = require('path')
const string = __filename;

console.log('path.sep :', path.sep, '경로 구분자');
console.log('path.delimiter :', path.delimiter, '환경 변수의 구분자');
console.log('path.dirname() :', path.dirname(string), '파일이 위치한 폴더 경로');
console.log('path.extname() :', path.extname(string), '파일의 퐉장자');
console.log('path.basename() :', path.basename(string), '파일의 이름,');
console.log('path.basename - extname :', path.basename(string, path.extname(string)), '파일 이름 _ 파일 확장자 모두 표시');
console.log('path.parse() :', path.parse(string), '파일 경롤르 root, dir ,base, ext, name으로 분리하여 표시');
console.log('path.format() :', path.format({dir: '/home', name:'path', ext: 'js'}), 'path.parse()한 객체를  파일 경로로 표시');
console.log('path.normalize() :', path.normalize('/home/user'), '\\ / 의 실수에 대해서 정상적인 경로를 표시해주는 함수');
console.log('path.isAbsolute() :', path.isAbsolute('/'), '절대 경로인지 상대경로 인지 boolean 으로 표시');
console.log('path.relative() :', path.relative('/home/user', '/'), '경로 두개를 넣어서 첫 번째 경로에서 두 번째 경로로 가는 방법을 알려줌');
console.log('path.join() :', path.join(__dirname, 'path.js'), '여러 인수를 넣어서 하나의 경로로 합쳐준다.');
console.log('path.resolve() :', path.resolve(__dirname, 'path.js'), 'join()과 비슷');

 // join 과 resolve 차이
 // join은 /을 상대 경로로 인식, resolve 는 /절대 경로로 인식
 console.log(path.join('/a','/b','c',)); // /a/b/c
 console.log(path.resolve('/a','/b','c',)); // /b/c