// for문 사용가능
for(i=0; i<100 ; i++){
    let result = db.integer.insertOne({x:i})
}

// cursor 
// 변수에 출력값의 대한 객체를 받아 iteral 처리 가능
// iteral 처리시 hasNext(), next() 호출시 서버 왕복 횟수를 줄이기 위해 100개 혹은 4MB의 크기 결과리르 가져온다.

let cursor = db.integer.find()

while (cursor.hasNext()){
    obj = cursor.next();
    print(obj.x) // 값 출력 함수
}

// limit(int) 출력값 개수 제한
db.integer.find().limit(3) // 3개 오브젝트만 출력

// skip(int) offset에 해당하며, 건너뛰기 기능을 제공한다. 3입력시 3개를 건너 뛰고 4번째 index번호부터 값을 가져 온다.
db.integer.find().skip(3)

// sort({필드 : option}) options : 1은 오름차순, -1은 내림차순
db.integer.find().sort({x : -1})

// count() 출력값의 개수를 알려준다.
db.integer.find().count()

// 복합 예시
db.integer.find().limit(10).sort({x: -1}).count()