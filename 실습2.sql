-- 1번
SELECT STUDENT_NO 학번,
       STUDENT_NAME 이름,
       ENTRANCE_DATE 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

-- 2번
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != '3';

-- 3번
SELECT PROFESSOR_NAME 교수이름,
       TO_CHAR(SYSDATE, 'YYYY')
       - (1900 + SUBSTR(PROFESSOR_SSN, 1, 2)) 나이
FROM TB_PROFESSOR
ORDER BY TO_CHAR(SYSDATE, 'YYYY')
       - (1900 + SUBSTR(PROFESSOR_SSN, 1, 2));

-- 4번
SELECT SUBSTR(PROFESSOR_NAME, 2, 2) 이름
FROM TB_PROFESSOR;

-- 5번
SELECT STUDENT_NO,
       STUDENT_NAME
FROM TB_STUDENT
WHERE TO_CHAR(ENTRANCE_DATE, 'RRRR') - (1900 + SUBSTR(STUDENT_SSN, 1, 2)) > 19;

-- 6번
SELECT TO_CHAR(TO_DATE('20201225','RRRRMMDD'),'DY')||'요일' 요일
FROM DUAL;

-- 7번
/*
TO_DATE('99/10/11', 'YY/MM/DD') - 2099년 10월 11일
TO_DATE('49/10/11', 'YY/MM/DD') - 2049년 10월 11일
TO_DATE('99/10/11', 'RR/MM/DD') - 1999년 10월 11일
TO_DATE('49/10/11', 'RR/MM/DD') - 1949년 10월 11일
*/

-- 8번
SELECT STUDENT_NO,
       STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO, 1, 1) != 'A';

-- 9번
SELECT ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10번 불가
SELECT COUNT(DEPARTMENT_NO) 학생수
FROM TB_STUDENT;

-- 11번
SELECT COUNT(STUDENT_NAME) COUNT
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12번 불가
SELECT TERM_NO
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'

-- 13번 불가

-- 14번 불가

-- 15번 불가