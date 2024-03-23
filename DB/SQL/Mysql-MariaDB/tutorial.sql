SHOW ENGINES ; -- 현재 스토리지 엔진의 종류 출력

SHOW PLUGINS; -- 현재 설치된 플러그인의 종류 출력

-- 컴포넌트 설치
INSTALL COMPONENT 'file://component_validate_password';

-- 멈포넌트 조회
SELECT * FROM mysql.component;

SET FOREIGN_KEY_CHECKS = OFF; -- 외래키 체크 해제
SET FOREIGN_KEY_CHECKS = ON; - - 외래키 체크 활성화

-- dabaase 생성
CREATE DATABASE tutorial_db;
commit ;

CREATE TABLE tutorial_db.member (
    m_id INT NOT NULL,
    m_name VARCHAR(20) NOT NULL,
    m_area VARCHAR(100) NOT NULL,
    PRIMARY KEY (m_id),
    INDEX ix_area (m_area)
);

SELECT * FROM member;
INSERT INTO member (m_id, m_name, m_area) values (3, '홍길동', '서울');
rollback ;

show variables like 'autocommit'; -- autocommit 설정 확인
set autocommit = 0; -- auto commit 해제
set autocommit = 1; -- auto commit 활성화

SELECT GLOBAL STATUS LKIE 'K ey%';

SELECT variables LIKE 'slow_qeury_log%';


select sleep(2);


CREATE TABLE tab_myisam (id INT not null primary key) ENGINE=MyISAM;
CREATE TABLE tab_innodb (id INT not null primary key) ENGINE=InnoDB;

insert into tab_myisam values (1);
insert into tab_innodb values (1);

SELECT * FROM tab_myisam;
SELECT * FROM tab_innodb;

insert into tab_myisam (id) values (1), (2), (3);
insert into tab_innodb (id) values (1), (2), (3);

-- innodb_autoinc_lock_mode
SHOW VARIABLES LIKE 'innodb_autoinc_lock_mode';
SET INNODB_AUTOINC_LOCK_MODE  = 0; -- 5.0 동일한 잠금 방식 모든 INSERT 문장은 자동 증가락을 사용한다.
SET INNODB_AUTOINC_LOCK_MODE  = 1; -- 단순히 한 건 또는 여러 건의 레코드를 INSERT할 때 정확히 예측할 수 있는 자동 증가락을 사용할 꼉우 뮤퉥스를 이용해 처리한다.
SET INNODB_AUTOINC_LOCK_MODE  = 2; -- 뮤텍스를 사용.


CREATE TABLE t1_zlib (c1 INT) compression = 'zlib'; -- 테이블 압축
select * from information_schema.tables where table_name = 't1_zlib'; -- 압축 확인

explain select * from t1_zlib; -- 압축 확인


show variables like 'optimizer_switch'; -- 옵티마이저 스위치 확인

select * from information_schema.INNODB_FT_DEFAULT_STOPWORD; -- 기본 불용어 확인

alter table member modify m_id int auto_increment; -- auto_increment 설정

set session innodb_parallel_read_threads = 4; -- 병렬 읽기 스레드 설정

set session innodb_parallel_read_threads = 8;
explain
select count(*) from member; -- 테이블 레코드 수 확인
set session innodb_parallel_read_threads = 1;

explain
select * from member order by m_area desc;

set optimizer_trace = 'enabled=on'; -- 옵티마이저 트레이스 활성화
set optimizer_trace_max_mem_size = 1000000; -- 옵티마이저 트레이스 메모리 사이즈 설정


DELIMITER $$ -- 구분자 변경
CREATE PROCEDURE LOOP_INSERT1()
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 1000000 DO
        INSERT INTO member (m_name, m_area) VALUES ('홍길동', '서울');
        SET i = i + 1;
    END WHILE;
end $$
DELIMITER ;;
CALL LOOP_INSERT1(); -- 프로시저 호출

COMMIT ;

explain analyze
select distinct m_name from member group by m_name;

show session status like 'Created_tmp%';

show variables like 'optimizer_switch';

explain
select *
  from member a
  join member b on a.m_id = b.m_id
 order by a.m_id;


explain
select
       b.m_name, a.m_name
  from member a,
       member b
 where b.m_id = a.m_id;


select FOUND_ROWS();

explain
select /*+ NO_INDEX(member m_id) */ * from member where m_id = 1;

explain analyze
select /*+ BNL(a) */ * from member a inner join member c on a.m_id = c.m_id;


create table TBL_JSON (
    id int auto_increment primary key,
    data json
);

alter table TBL_JSON add column age varchar(10) as (data ->> '$.age'); -- 가상 컬럼 추가

alter table TBL_JSON add index idx_age (age) using btree;
alter table TBL_JSON add index idx_age2 ((CAST(data ->> '$.age' as char(3) ))) using btree;

select * from TBL_JSON;

insert into TBL_JSON (data) values ('{"name": "홍길동", "age": 21}');
commit;

select id, json_pretty(data) from TBL_JSON;

select id, json_storage_size(data) from TBL_JSON;

explain
select id, data from TBL_JSON where data ->> '$.age' = 21; -- json 데이터 추출

explain
select id, data from TBL_JSON where json_contains(data, '{"age": 20}'); -- json 데이터 추출

explain
select id, data, age from TBL_JSON where age = 21; -- 가상 컬럼 사용

select JSON_OBJECT('id', id, 'data', data)
  from TBL_JSON;

select concat(current_date, ' ', current_time); -- 현재 시간 출력


explain
select count(m_area), m_id from member group by m_area, m_id; -- 인덱스 사용하는 group by

explain
select count(m_area), m_id from member group by m_id, m_area; -- 인덱스 제대로 사용하지 않는 group by

explain
select * from member order by m_id desc, m_area desc;

explain
select m_id, m_area from member order by m_area, m_id; -- 인덱스 사용하는 order by

explain
select m_name from member order by m_id, m_area; -- 인덱스 제대로 사용하지 않는 order by

explain
select m_id, m_area from member where m_id in (1, 2, 3, 4) order by m_area; -- 인덱스 사용하는 where

explain
select m_id, m_area from member where m_name = 'test' order by m_id; -- 인덱스 사용하는 where

explain
select m_id, m_area from member where m_area = 'test1'; -- 인덱스 사용하는 where

explain
select m_id, m_area from member where isnull(m_area); -- 인덱스 사용하는 where

select str_to_date('20210101', '%Ymmdd'); -- 날짜 계산

explain analyze
select m_id, m_area from member limit 10, 10;

explain analyze
select a.m_id, b.m_id
  from member a
  left join member b on b.m_id = a.m_id and b.m_id in (1, 2, 3, 4); -- left join 사용

explain analyze
select a.m_id, b.m_id
  from member a
  left join member b on b.m_id = a.m_id -- inner join으로 변경
 where b.m_id in (1, 2, 3, 4);
