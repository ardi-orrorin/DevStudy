/* 
인덱스를 사용하지 않는 쿼리를 컬렉션 스캔(collection scan)이라고 하며,
서버가 쿼리 결과를 찾으려면 '전체 내용을 살펴봐야함'을 의미한다.

*/


for(i = 0 ; i< 100000000; i++){
    db.index.insertOne({
        i : i,
        username : 'user'+ i,
        age : Math.floor(Math.random() * 100),
        created : new Date() 
    })
}

// explain 쿼리가 실행될 때 몽고db가 무엇을 하는 지 확인 할 수 있다.
db.index.find().explain()
db.index.find().explain('executionStats')

// index 생성 함수 username : true 의미
// createIndex({필드:1 or true})
db.index.createIndex({username : 1})


// 복합 index
// createIndex({필드1 : 1, 필드2 : 1})
db.index.createIndex({username : 1, age : 1})

db.index.find({age : {$gt : 30}})
.limit(1000)
.forEach(
    function(e){
        print(JSON.stringify(e))
    })

