// 쿼리 출력 결과 사이즈 변경
DBQuery.shellBatchSize=1000

// 유저 목록 조회
show users 
db.getUsers()


// 계정 생성
db.createUser({
    user : "test",
    pwd : passwordPrompt(),
    roles : [
        { role : "userAdminAnyDatabase", db: "admin"}, 
        { role : "readWriteAnyDatabase", db: "admin"},
        { role : "dbAdminAnyDatabase", db : "admin" },
        { role : "clusterAdmin", db : "admin" },
        { role : "restore", db : "admin" },
        { role : "backup", db : "admin" }
    ]
})

show 