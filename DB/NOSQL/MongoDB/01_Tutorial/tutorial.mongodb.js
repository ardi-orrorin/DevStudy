show dbs  // 현재 디비 목록 출력
db // 현재 실행 중인 DB 출력
db.stats() // 현재 실행중인 데이터베이스의 상세정보
db.dropDatabase() // 현재 실행중인 데이터베이스를 삭제한다.
db.createCollection("테스트컬렉션")  // 컬렉션 생성
show collections // 컬렉션 전체 조회
db.help() // database 수준의 도움말
db.mycoll.help() // collection 수준의 도움말
sh.help() // sharding 수준의 도움말
show users // 현재 DB에 유저 리스트
// db.컬렉션01.find() 해당 컬렉션 값 모두 조회
// db.컬렉션01.insert({ "02": "값02" }) 컬렉션에 키-값 추가
// db.컬렉션01.remove({"01":"값01"}) // 컬렉션에 지울 키와 값 동일한 모든 키-값 삭제 
// db.컬렉션01.find({ "01": "값01" })
// db.컬렉션01.find({"02":"값02"})

