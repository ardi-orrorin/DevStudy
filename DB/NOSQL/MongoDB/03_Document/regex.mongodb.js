// 정규식
// 정규식 옵션
// i(ignore case) : 대소문자 구별 안함
// m(multi line) : 여러 줄
// x : 모든 공백 및 주석 무시
// s : 개행 문자 포함 
// g(global) : 문자열 내의 모든 패턴 검색
// u(unicode) : 유니코드 전체를 지원
// y(sticky) : 문자 내 특정 위치에서 검색을 진행 'sticky' 모드를 활성화
// 필드명 : {$regex: 'pattern', $options : 'options' })
// db.book.find({"name" : {$regex: '^a', $options: 'i'}})

db.book.insert({"name" : "test  123 456 test"})

db.book.find({"name" : {$regex: '^a', $options: 'i'}}) // 대소문자 구부없음
db.book.find({"name" : {$regex: '^T', $options: 'm'}}) // 여러 줄 일치
db.book.find({"name" : {$regex: '^t', $options: 'im'}}) // 대소 문자 구분 없음 + 여러 줄 일치
db.book.find({"name" : {$regex : '12', $options : 'x'}})





