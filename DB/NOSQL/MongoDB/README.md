# 몽고 DB


# MongoDB Docker 설치

## MACOSX - VERSION
<pre>
<code>

$ docker pull mongo
$ docker run --name mongodb-container -v ~/data:/data/db -d -p 27017:27017 mongo

// mongoDB 기본 포트 27017

// 컨테이너 접속 후 

$ mongo

</code>
</pre>

# 개념

## Document
### Document는 RDMS의 record 와 비슷한 개념으로 이의 데이터 구조는 한개 이상의 key-value 한쌍으로 이뤄져있습니다. 
<pre>
<code>
  {
    "_id": {
      "$oid": "64ba4b72eb9aa8df1b0fa4a0"
    },
    "02": "값02"
  }
</code>
</pre>

### id : 12Bytes 의 hexadecimal값 Document 내에 유일함(uniqueness)을 제공한다.

db.컬렉션01.find({ "Key": "Value" }) <- 키-값을 입력해서 조회할 수 있다.

## Collection
### Document들이 Collection내부에 위치하고 있으며, RDMS의 table과 비슷하지만 RDMS와 달리 schema를 갖고 있지 않다.

show collections <-으로 컬렉션 목록 조회

## Database
### Database는 Collection들의 물리적인 컨테이너 저장소.
show dbs <- DB목록 조회

# 참고자료 및 링크
### [Inpa-Dev](https://inpa.tistory.com/entry/MONGO-%F0%9F%93%9A-%EB%AA%BD%EA%B3%A0%EB%94%94%EB%B9%84-%EC%BF%BC%EB%A6%AC-%EC%A0%95%EB%A6%AC#%EC%BB%AC%EB%A0%89%EC%85%98_%EC%A1%B0%ED%9A%8C)