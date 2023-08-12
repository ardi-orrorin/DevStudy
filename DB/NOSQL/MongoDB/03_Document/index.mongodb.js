/* 
인덱스를 사용하지 않는 쿼리를 컬렉션 스캔(collection scan)이라고 하며,
서버가 쿼리 결과를 찾으려면 '전체 내용을 살펴봐야함'을 의미한다.

*/


for(i = 0 ; i< 1000; i++){
    db.test1.insertOne({
        i : i,
        username : 'user'+ i,
        age : Math.floor(Math.random() * 100),
        date : new Date() 
    })
}

// explain 쿼리가 실행될 때 몽고db가 무엇을 하는 지 확인 할 수 있다.
db.index.find().explain()
db.index.find().explain('executionStats')

// index 생성 함수 username : 오름차순 의미
// createIndex({필드 : 1}) 1 오름차순, -1 내림차순
db.index.createIndex({username : 1})


// 복합 index
// createIndex({필드1 : 1, 필드2 : 1})
db.index.createIndex({username : 1, age : 1})

// Text Index 생성
db.index.createIndex({username: 'text'});
// 모든 필드에 대한 Index 생성
db.index.createIndex({'$**': 'text'});


// Text 단일 Index시 검색
db.index.find({$text: {$search: 'user1'}}).sort({age:1});

// Text 단일 Index시  OR 검색

db.index.find({$text: {$search: '\'user1 \'user2 \'user3'}});

// Text 단일 Index시 And 검색
db.index.find({$text: {$search: '\'user1\' \'user2\' \'user3\' \'user03\''}});

// 점누 검색 최적화
// 복합 인덱스
// 출력할 필드와 복합 인덱스 생성
db.index.createIndex({age: 1, username: 'text'})


db.index.find({username: 'user1'}).sort({age: 1});


// 텍스트 전문 언어 설정
db.index.createIndex({age: 1, username: 'text'},{default_language: 'english'})

// 인덱스 삭제 {키:1}
db.index.dropIndex({usernae: 1});
db.index.dropIndexes();

// 인덱스 재 인덱싱 실행
db.index.reIndex();




db.index.find({age : {$gt : 30}})
.limit(1000)
.forEach(
    function(e){
        print(JSON.stringify(e))
    })

db.test1.find()
    .forEach(
        function(e){
            print(JSON.stringify(e))
        })


