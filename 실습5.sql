-- 1번
CREATE TABLE CUSTOMERS(
    CNO     NUMBER(5) PRIMARY KEY,
    CNAME   VARCHAR2(10) NOT NULL,
    ADDRESS VARCHAR2(50) NOT NULL,
    EMAIL   VARCHAR2(20) NOT NULL,
    PHONE   VARCHAR2(20) NOT NULL
);
SELECT  *
FROM    CUSTOMERS;

CREATE TABLE ORDERS(
    ORDERNO     NUMBER(10) PRIMARY KEY,
    ORDERDATE   DATE DEFAULT SYSDATE NOT NULL,
    ADDRESS     VARCHAR2(50) NOT NULL,
    PHONE       VARCHAR2(20) NOT NULL,
    STATUS      VARCHAR2(20) NOT NULL,
    CHECK(STATUS IN ('결제완료', '배송중', '배송완료')),
    CNO         NUMBER(5) NOT NULL,
    FOREIGN KEY(CNO) REFERENCES CUSTOMERS(CNO)
);
SELECT  *
FROM    ORDERS;

CREATE TABLE PRODUCTS(
    PNO     NUMBER(5) PRIMARY KEY,
    PNAME   VARCHAR2(20) NOT NULL,
    COST    NUMBER(8) DEFAULT 0 NOT NULL,
    STOCK   NUMBER(5) DEFAULT 0 NOT NULL
);
SELECT  *
FROM    PRODUCTS;

CREATE TABLE ORDERDETAIL(
    ORDERNO NUMBER(10),
    PNO     NUMBER(5),
    QTY     NUMBER(5) DEFAULT 0 NOT NULL,
    COST    NUMBER(8) DEFAULT 0 NOT NULL,
    FOREIGN KEY(ORDERNO) REFERENCES ORDERS(ORDERNO),
    FOREIGN KEY(PNO)     REFERENCES PRODUCTS(PNO),
    PRIMARY KEY(ORDERNO, PNO)
);
SELECT  *
FROM    ORDERDETAIL;

-- 2번
INSERT INTO PRODUCTS VALUES(1001, '삼양라면', 1000, 200);
INSERT INTO PRODUCTS VALUES(1002, '새우깡', 1500, 500);
INSERT INTO PRODUCTS VALUES(1003, '월드콘', 2000, 350);
INSERT INTO PRODUCTS VALUES(1004, '빼빼로', 2000, 700);
INSERT INTO PRODUCTS VALUES(1005, '코카콜라', 1800, 550);
INSERT INTO PRODUCTS VALUES(1006, '환타', 1600, 300);
SELECT  *
FROM    PRODUCTS;

-- 3번
INSERT INTO CUSTOMERS VALUES(101, '김철수', '서울 강남구', 'cskim@naver.com', '899-6666');
INSERT INTO CUSTOMERS VALUES(102, '이영희', '부산 서면', 'yhlee@empal.com', '355-8882');
INSERT INTO CUSTOMERS VALUES(103, '최진국', '제주 동광양', 'jkchoi@gmail.com', '852-5764');
INSERT INTO CUSTOMERS VALUES(104, '강준호', '강릉 홍제동', 'jhkang@hanmail.com', '559-7777');
INSERT INTO CUSTOMERS VALUES(105, '민병국', '대전 전민동', 'bgmin@hotmail.com', '559-8741');
INSERT INTO CUSTOMERS VALUES(106, '오민수', '광주 북구', 'msoh@microsoft.com', '542-9988');
SELECT  *
FROM    CUSTOMERS;

-- 4번
INSERT INTO ORDERS VALUES(1, SYSDATE-3, '서울 강남구', '899-6666', '결제완료', 101);
INSERT INTO ORDERDETAIL VALUES(1, 1001, 50, 1000);

-- 5번
UPDATE  PRODUCTS
SET     STOCK = 150
WHERE   PNO = 1001;

-- 6번
INSERT INTO ORDERS VALUES(2, SYSDATE-2, '부산 수영구', '337-5000', '결제완료', 102);
INSERT INTO ORDERDETAIL VALUES(2, 1002, 100, 1500);
INSERT INTO ORDERDETAIL VALUES(2, 1003, 150, 2000);

-- 7번
UPDATE  PRODUCTS
SET     STOCK = 400
WHERE   PNO = 1002;

UPDATE  PRODUCTS
SET     STOCK = 200
WHERE   PNO = 1003;

-- 8번
INSERT INTO ORDERS VALUES(3, SYSDATE-1, '광주 북구', '652-2277', '결제완료', 106);
INSERT INTO ORDERDETAIL VALUES(3, 1004, 100, 2000);
INSERT INTO ORDERDETAIL VALUES(3, 1005, 50, 1800);

-- 9번
UPDATE  PRODUCTS
SET     STOCK = 600
WHERE   PNO = 1004;

UPDATE  PRODUCTS
SET     STOCK = 500
WHERE   PNO = 1005;

-- 10번
SELECT  O.ORDERNO,
        ORDERDATE,
        CNAME,
        C.ADDRESS,
        C.PHONE,
        STATUS,
        PNAME,
        D.COST,
        D.QTY,
        D.COST * D.QTY 가격
FROM    ORDERS O
JOIN    CUSTOMERS C ON (C.CNO = O.CNO)
JOIN    ORDERDETAIL D ON (O.ORDERNO = D.ORDERNO)
LEFT JOIN   PRODUCTS USING(PNO);

SELECT  *
FROM    PRODUCTS;

-- 11번
SELECT  ORDERDATE,
        SUM(D.COST * D.QTY) 가격
FROM    ORDERS O
JOIN    ORDERDETAIL D ON (O.ORDERNO = D.ORDERNO)
GROUP BY    ORDERDATE
ORDER BY    ORDERDATE;

-- 12번
INSERT INTO PRODUCTS VALUES(1007, '목캔디', 3000, 500);

-- 13번
INSERT INTO ORDERS VALUES(4, SYSDATE, '제주 동광양', '852-5764', '결제완료', 103);
INSERT INTO ORDERDETAIL VALUES(4, 1007, 200, 3000);

UPDATE  PRODUCTS
SET     STOCK = 300
WHERE   PNO = 1007;