-- 1번
CREATE TABLE MEMBER(
    MEMBER_ID   NUMBER(10) PRIMARY KEY,
    NAME        VARCHAR2(25) NOT NULL,
    ADDRESS     VARCHAR2(100),
    CITY        VARCHAR2(30),
    PHONE       VARCHAR2(15),
    JOIN_DATE   DATE DEFAULT SYSDATE NOT NULL
);
SELECT  *
FROM    MEMBER;

CREATE TABLE TITLE(
    TITLE_ID        NUMBER(10) PRIMARY KEY,
    TITLE           VARCHAR2(60) NOT NULL,
    DESCRIPTION     VARCHAR2(400) NOT NULL,
    RATING          VARCHAR2(20),
    CHECK(RATING IN ('18가', '15가', '12가', '전체가')),
    CATEGORY        VARCHAR2(20),
    CHECK(CATEGORY IN ('드라마', '코미디', '액션', '아동', 'SF', '다큐멘터리')),
    RELEASE_DATE    DATE
);
SELECT  *
FROM    TITLE;

CREATE TABLE TITLE_COPY(
    COPY_ID     NUMBER(10),
    TITLE_ID    NUMBER(10),
    STATUS      VARCHAR2(20) NOT NULL,
    CHECK(STATUS IN ('대여가능', '파손', '대여중', '예약')),
    FOREIGN KEY(TITLE_ID) REFERENCES TITLE(TITLE_ID),
    PRIMARY KEY(COPY_ID, TITLE_ID)
);
SELECT  *
FROM    TITLE_COPY;

CREATE TABLE RENTAL(
    BOOK_DATE       DATE DEFAULT SYSDATE,
    MEMBER_ID       NUMBER(10),
    COPY_ID         NUMBER(10),
    TITLE_ID        NUMBER(10),
    ACT_RET_DATE    DATE,
    EXP_RET_DATE    DATE DEFAULT SYSDATE+2,
    FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
    FOREIGN KEY(COPY_ID, TITLE_ID) REFERENCES TITLE_COPY(COPY_ID, TITLE_ID),
    PRIMARY KEY(BOOK_DATE, MEMBER_ID, COPY_ID, TITLE_ID)
);
SELECT  *
FROM    RENTAL;

CREATE TABLE RESERVATION(
    RES_DATE    DATE,
    MEMBER_ID   NUMBER(10),
    TITLE_ID    NUMBER(10),
    FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
    FOREIGN KEY(TITLE_ID) REFERENCES TITLE(TITLE_ID),
    PRIMARY KEY(RES_DATE, MEMBER_ID, TITLE_ID)
);
SELECT  *
FROM    RESERVATION;

-- 2번
CREATE SEQUENCE MEMBER_ID_SEQ
START WITH 101;

CREATE SEQUENCE TITLE_ID_SEQ
START WITH 92;

-- 3번
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '인어공주', '인어공주 설명', '전체가', '아동', '95/10/05');
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '매트릭스', '매트릭스 설명', '15가', 'SF', '95/05/19');
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '에이리언', '에이리언 설명', '18가', 'SF', '95/08/12');
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '모던타임즈', '모던타임즈 설명', '전체가', '코미디', '95/07/12');
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '러브스토리', '러브스토리 설명', '전체가', '드라마', '95/09/12');
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '람보', '람보 설명', '18가', '액션', '95/06/01');
SELECT  *
FROM    TITLE;

-- 4번
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '김철수', '강남구', '서울', '899-6666', '90/03/08');
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '이영희', '서면', '부산', '355-8882', '90/03/08');
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '최진국', '동광양', '제주', '852-5764', '91/06/17');
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '강준호', '홍제동', '강릉', '559-7777', '90/04/07');
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '민병국', '전민동', '대전', '559-8741', '91/01/18');
INSERT INTO MEMBER VALUES(MEMBER_ID_SEQ.NEXTVAL, '오민수', '북구', '광주', '542-9988', '91/01/18');
SELECT  *
FROM    MEMBER;

-- 5번
INSERT INTO TITLE_COPY VALUES(1, 92, '대여가능');
INSERT INTO TITLE_COPY VALUES(1, 93, '대여가능');
INSERT INTO TITLE_COPY VALUES(2, 93, '대여중');
INSERT INTO TITLE_COPY VALUES(1, 94, '대여가능');
INSERT INTO TITLE_COPY VALUES(1, 95, '대여가능');
INSERT INTO TITLE_COPY VALUES(2, 95, '대여가능');
INSERT INTO TITLE_COPY VALUES(3, 95, '대여중');
INSERT INTO TITLE_COPY VALUES(1, 96, '대여가능');
INSERT INTO TITLE_COPY VALUES(1, 97, '대여가능');
SELECT  *
FROM    TITLE_COPY;

-- 6번
INSERT INTO RENTAL VALUES(SYSDATE-3, 101, 1, 92, SYSDATE-2, SYSDATE-1);
INSERT INTO RENTAL VALUES(SYSDATE-1, 103, 2, 93, NULL, SYSDATE+1);
INSERT INTO RENTAL VALUES(SYSDATE-2, 104, 3, 95, NULL, SYSDATE);
INSERT INTO RENTAL VALUES(SYSDATE-4, 105, 1, 97, SYSDATE-2, SYSDATE-2);
SELECT  *
FROM    RENTAL;

-- 7번
CREATE VIEW TITLE_AVAIL
AS  SELECT  T.TITLE,
            C.COPY_ID,
            C.STATUS
    FROM    TITLE_COPY C, TITLE T
    WHERE   C.TITLE_ID = T.TITLE_ID;

SELECT  *
FROM    TITLE_AVAIL;

-- 8번
INSERT INTO TITLE VALUES(TITLE_ID_SEQ.NEXTVAL, '스타워즈', '스타워즈 설명', '전체가', 'SF', '77/07/07');

-- 9번
ALTER TABLE TITLE ADD PRICE NUMBER(5) DEFAULT 0 NOT NULL;

UPDATE  TITLE
SET     PRICE = 3000
WHERE   TITLE = '인어공주';

UPDATE  TITLE
SET     PRICE = 2500
WHERE   TITLE = '매트릭스';

UPDATE  TITLE
SET     PRICE = 2000
WHERE   TITLE = '에이리언';

UPDATE  TITLE
SET     PRICE = 3000
WHERE   TITLE = '모던타임즈';

UPDATE  TITLE
SET     PRICE = 3500
WHERE   TITLE = '러브스토리';

UPDATE  TITLE
SET     PRICE = 2000
WHERE   TITLE = '람보';

UPDATE  TITLE
SET     PRICE = 1500
WHERE   TITLE = '스타워즈';

-- 10번
SELECT  *
FROM    RENTAL;