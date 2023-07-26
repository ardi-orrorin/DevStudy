// 1. 기본적으로는 하나의 커뤼만 수정 가능
// 2-1. $set을 해야 해당 필드만 바뀐다.
// 2-2. $set을 넣지 않고 업데이트를 할 경우 doment의 모든 내용이 다 지워지고 업데이트 쿼리로 입력한 내용만 남게 된다.
// 2-3. 쿼리 내용이 객체로 document를 대체한다.
// 3-1. $push 배열의 값을 갖는 필드를 생성
// 3-2. $pull 배열의 값을 삭제 한다. 배열의 모든 값을 삭제해도 배열 필드는 유지 된다.
// 4-1. updateOne 매칭되는 document 중 첫번째만 수정
// 4-2. udpateMany는 매칭되는 모든 document를 수정 {multi : true}의 옵션이 적용된 메소드이다.
// 4-3. replaceOne document를 통째로 다른 객체로 수정하는 것 $set을 안 쓴 update와 같은 메소드이다.
// db.book.update({
//     "name" : 'abc'
// },{ $set : {
//     'date' : '2023-07-24'
//     }
// })

// 5. findAndModify upsert(update + insert)과 remove까지를 같이 수행, 한 행만 업데이트 한다.
// 5-1. qeury - 찾을 대상 {필드 : 값}
// 5-2. update - 수정할 내용 {$set : {필드 : 값}}
// 5-3. new - 수정 이전의 document를 반환할지, 수정 이후 document를 반환할 지 결정 {new : true} 넣으면 수정이후의 document 반환
// 5-4. 중복된 document가 있다면 sort 옵션을 통해 정렬된 첫번쩨 document를 선택할 수 있다.
// 그밖에 findOneAndUpdate / findOneAndReplace가 있다. 
// db.book.findAndModify({
//     query : { name : '책'},
//     update : {$push : {seller : '홍길이'}},
//     new : true  // 수정 이후 값을 반환
// })

db.book.find().sort({"date" : 1})

db.book.update({
    "name" : 'abc' // name 필드의 abc 값을 찾아
},{ $set : {
    'date' : '2023-07-24' // date필드의 값을 2023-07-24로 변경, 없을 경우 필드가 생성됨

    }
})

db.book.update({
    "name" : 'abcdef'
},{ $set : {
    'date' : '2023-07-24'
    }
},{
    upsert : true // update + insert 합성어로 해당 update시 해당 document가 없다면 insert를 진행
})

db.book.update({
    "date" : {$eq : "2023-07-23"}
},{
    $set : {
        'amount' : 200
    }
},{
    multi : true // update document 한 개만 수정되지만, 여러개의 documnet를 업데이트 하기위해서는 multi : true을 값을 추가하면 된다.
})

db.book.update({
    "date" : {$eq : "2023-07-23"}
},{
    $push : {  // $push를 이용하여 seller라는 필드에 홍기동이라는 값을 추가
        "seller" : '홍기동'
    }
})


db.book.update({
    "date" : {$eq : "2023-07-23"}
},{
    $pull : {  // $push를 이용하여 seller라는 필드에 홍기동이라는 값을 추가
        "seller" : '홍기동'
    }
})

db.book.findAndModify({
    query : { name : '책'},  // 찾을 document
    update : {$push : {seller : '홍길이'}}, // 변경할 값
    new : true  // 반환 시점 true : 수정 후, false : 수정 전
})
