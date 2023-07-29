db.book.find()


// $where
// $where 사용시 해당 collection 이라는 범위를 지정하기 위해 this를 사용한다.
// find({$where : "this.name == 'abc'"})
// find({$where : function(){}}) // 자바스크립트 함수형도 사용이 가능하다.

db.book.find({
    $where : "this.name == 'abc'"
})

db.book.find({$where : function(){
    if(this.name == '책') return true
}}) 

// 정렬 (sort)
// sort({필드 : option })
// option 1은 오름차순, -1은 내림차순
db.book.find().sort({"date":1})


// Projection (선택 필드)
// projection이란 find 와 findOne 메소드의 두 번째 인자를 넣어주는 것
// 결과로 보여줄 것만 필터링
// Projection이 유요한 경우 민감한 데이터가 있을 경우
// 용량이 줄어든다.
// find({},{"_id":false, "name":true, "author": false, "date" : false})  2번째 인자 값에 option으로 보져질 Field를 설정한다.
// true, false는 1, 0으로 표현 할 수도 있다.
// 선택 필드에 없는 필드는 false가 적용한다.
// document에 따라 필드가 존재 여부 다를 경우, 선택 필드를 사용하면 오류가 발생한다. 선택 필드로 사용하고 싶다면 true 값만 주면 해결 된다.

db.book.find({},{"_id":false, "name":true, "date" : true})
db.book.find({},{"_id":0, "name":1, "date" : 1})