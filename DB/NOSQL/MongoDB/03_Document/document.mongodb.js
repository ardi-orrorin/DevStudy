// documnet 데이터삽입
// insert - 단일 또는 다수의 Document를 입력할 때 사용, 만일 컬렉션이 존재하지 않는다면 자동으로 생성해주고 insert한다.
// insertOne - 단일 document를 입력
// insertMany - 다수 document를 입력

db.book.insert({"name" : "abc"}) // 단일

db.book.insert({
    "name" : "책",
    "author" : {
        "name" : "kim"
    },
    "date" : "2023-07-23",
})

db.book.insert({
    "name" : "책",
    "author" : {
        "first_name" : "kim",
        "first_name" : "danbi", // 키 중복 안됨
    },
    "date" : "2023-07-23",
})


db.book.insert({
    "name" : "책",
    "author" : {
        "first_name" : "kim",
        "last_name" : "danbi", // 키 중복 안됨
    },
    "date" : "2023-07-23",
})



// db.book.find() // 컬렉내 document 조회

db.book.find() // 컬렉내 document 조회
db.book.find().pretty() // document를 좀더 깔끔하게 출력
db.book.find({"name" : "책"}) // name이 책인 document를 조회
db.book.find({"name" : "책"}).pretty()

db.book.findOne({"name": "책"}) // name이 책인 document 한개만 조회