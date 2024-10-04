INSERT INTO USER_INFO (REG_DT) VALUES (SYSDATE);

DROP TABLE USER_INFO;

CREATE TABLE MEMBER (
	EMAIL VARCHAR2(65) NOT NULL,
	PASSWORD VARCHAR2(65) NOT NULL,
	NAME VARCHAR2(45) NOT NULL,
	AGE NUMBER(3),
	REG_DT DATE
);

--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='MEMBER';
--SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME ='MEMBER'; 

INSERT INTO MEMBER VALUES ('USER01@test.org','123456','사용자01', NULL, SYSDATE);

SELECT * FROM MEMBER;

TRUNCATE TABLE MEMBER;

ALTER TABLE MEMBER ADD MOBILE VARCHAR2(15) NOT NULL;

DROP TABLE MEMBER;

CREATE TABLE MEMBER (
	EMAIL VARCHAR2(65) UNIQUE NOT NULL,
	PASSWORD VARCHAR2(65) NOT NULL,
	NAME VARCHAR2(45) NOT NULL,
	REG_DT DATE
);

SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES ('USER01@test.org', '123456', '사용자01', SYSDATE);
INSERT INTO MEMBER VALUES (NULL, '123456', '사용자01', SYSDATE);









