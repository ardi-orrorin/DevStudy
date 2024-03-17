SHOW ENGINES ; -- 현재 스토리지 엔진의 종류 출력

SHOW PLUGINS; -- 현재 설치된 플러그인의 종류 출력

-- 컴포넌트 설치
INSTALL COMPONENT 'file://component_validate_password';

-- 멈포넌트 조회
SELECT * FROM mysql.component;

SET FOREIGN_KEY_CHECKS = OFF; -- 외래키 체크 해제
SET FOREIGN_KEY_CHECKS = ON; -- 외래키 체크 활성화

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




