db.createCollection("book")  // 컬렉션 생성
db.createCollection(
    "book",
    {
        capped : true,  //  true 설정시 고저(Fixed)크기, 사이즈 ㅊ과시 가장 오래된 document부터 삭제
        size : 512000,  //  capped가 true 인 경우 필수로 설정해야 하는 값, 컬렉션의 최대 사이즈
        max : 10000     //  최대 document 갯수
    }
)

show collections  // 컬렉션 Document 포함 목록 조회
db.getCollectionNames() // 컬렉션 이름 목록만 조회


// 칼렉션 삭제 
// db.컬렉션명.drop()

db.테스트컬렉션.drop() // 컬렉션 삭제

db.test2.find()

db.createCollection("CalendarAlert")

db.CalendarAlert.find()
db.CalendarAler.find()
db.CalendarAlert.find().sort({"endDate":-1})


db.test2.find({'_id' : {$eq : '64da0b4be2894b7f9cb2fe9e'}})
db.test2.find().sort({createDate:  -1})

db.test2.find();

db.CalendarAler.drop()
