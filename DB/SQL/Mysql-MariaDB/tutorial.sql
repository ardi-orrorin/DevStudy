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

SELECT GLOBAL STATUS LKIE 'K ey%';

SELECT variables LIKE 'slow_qeury_log%';


select sleep(2);
