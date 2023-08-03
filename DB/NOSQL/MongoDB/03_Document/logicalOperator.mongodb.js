{필드 : {$gt : 값}}  // 필드 > 값
db.book.find({
    amount : {$gt : 100}
}) // 100 초과

{필드 : {$lt : 값}}  // 필드 < 값


{필드 : {$gte : 값}}  // 필드 >= 값
{필드 : {$lte : 값}}  // 필드 <= 값

{필드 : {$eq : 값}}  // 필드 == 값
{필드 : {$ne : 값}}  // 필드 != 값

{필드 : {$in : [값1, 값2, 값3]}}  // 필드 == (값1 or 값2 or 값3)
{필드 : {$nin : [값1, 값2, 값3]}}  // 필드 != (값1 and 값2 and 값3)

db.book.find({
    "date" : { $eq : "2023-07-24"}
})

db.test2.find({receiveList : {$eq : 199}}) // receiveList 배열 내에 값을 기준으로 조회

// 조건1 or 조건2
{$or : [{조건1}, {조건2}]} 

// 조건2 and 조건2
{$and : [{조건1},{조건2}]}

// not
{$not : {조건}}

// 조건이 모두 만족하지 않는 document
{$nor : [{조건1},{조건2}]}

// 복합 조건 (조건1 && 조건2) && (조건3 || 조건4)
{$and : [
    {$and : [{조건1},{조건2}]}.
    {$or : [{조건3},{조건4}]}
]}

// $all 2이상의 배열 요소가 일치하는 배열을 찾을 때 사용
db.book.find({
    'seller' : {$all : ['홍길동','홍길이']}
})

// $size 배열의 사이즈가 같은 document를 찾았는다.
// $size 는 다른 조건걸과 같이 결합해서 사용할 수 없다.
db.book.find({
    'seller' : {$size :  3}
})

// $slice 조건에 맞는 document에서 지정한 배열의 일부분만 가져온다.
// {$slice :  2} 2는 2개를 의미 index 0부터 1까지 2개의 값을 반환한다.
// {$slice :  -1} -1는 마지막 값을 반환
// {$slice :  [2,10]}는 index 번호 2부터 10개를 총 12개를 반환한다.
db.book.find({
    'name' : {$eq : '책'}
},{
    'seller' : {$slice :  2}
})

db.book.find({
    'name' : {$eq : '책'}
},{
    'seller' : {$slice :  [1,2]}
})

db.book.find({
    'name' : {$eq : '책'}
},{
    'seller.$' : 1 
})

db.book.find()


