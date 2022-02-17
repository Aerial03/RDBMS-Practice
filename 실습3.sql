-- 1번
SELECT  STUDENT_NAME "학생 이름",
        STUDENT_ADDRESS 주소지
FROM    TB_STUDENT
ORDER BY    "학생 이름";

-- 2번
SELECT  STUDENT_NAME,
        STUDENT_SSN
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'Y'
ORDER BY    STUDENT_SSN DESC;

-- 3번
SELECT  STUDENT_NAME 학생이름,
        STUDENT_NO 학번,
        STUDENT_ADDRESS "거주지 주소"
FROM    TB_STUDENT
WHERE   (SUBSTR(STUDENT_ADDRESS, 1, 2) = '강원' OR SUBSTR(STUDENT_ADDRESS, 1, 2) = '경기') AND
        SUBSTR(STUDENT_NO, 1, 1) = '9'
ORDER BY    학생이름;

-- 4번
SELECT  PROFESSOR_NAME,
        PROFESSOR_SSN
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO = '005'
ORDER BY    PROFESSOR_SSN;

-- 5번
SELECT  STUDENT_NO,
        POINT
FROM    TB_GRADE
WHERE   CLASS_NO = 'C3118100' AND TERM_NO = '200402'
ORDER BY    POINT DESC, STUDENT_NO;

-- 6번
SELECT  STUDENT_NO,
        STUDENT_NAME,
        D.DEPARTMENT_NAME
FROM    TB_STUDENT S
JOIN    TB_DEPARTMENT D USING(DEPARTMENT_NO)
ORDER BY    STUDENT_NAME;

-- 7번
SELECT  CLASS_NAME,
        D.DEPARTMENT_NAME
FROM    TB_CLASS C
JOIN    TB_DEPARTMENT D USING(DEPARTMENT_NO);

-- 8번
SELECT  N.CLASS_NAME,
        P.PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR C
JOIN    TB_CLASS N USING(CLASS_NO)
JOIN    TB_PROFESSOR P USING(PROFESSOR_NO);

-- 9번
SELECT  N.CLASS_NAME,
        P.PROFESSOR_NAME
FROM    TB_CLASS_PROFESSOR C
JOIN    TB_CLASS N USING(CLASS_NO)
JOIN    TB_PROFESSOR P USING(PROFESSOR_NO)
WHERE   P.DEPARTMENT_NO >= 1 AND P.DEPARTMENT_NO <= 21;

-- 10번(미해결)
SELECT  STUDENT_NO 학번,
        S.STUDENT_NAME "학생 이름"
FROM    TB_GRADE G
JOIN    TB_STUDENT S USING(STUDENT_NO)
WHERE   S.DEPARTMENT_NO = 59;

-- 11번
SELECT  D.DEPARTMENT_NAME 학과이름,
        STUDENT_NAME 학생이름,
        P.PROFESSOR_NAME 지도교수이름
FROM    TB_STUDENT S
JOIN    TB_DEPARTMENT D USING(DEPARTMENT_NO)
JOIN    TB_PROFESSOR P ON (P.PROFESSOR_NO = S.COACH_PROFESSOR_NO)
WHERE   STUDENT_NO = 'A313047';

-- 12번
SELECT  S.STUDENT_NAME,
        TERM_NO TERM_NAME
FROM    TB_GRADE G
JOIN    TB_STUDENT S USING(STUDENT_NO)
WHERE   SUBSTR(TERM_NO, 1, 4) = '2007' AND CLASS_NO = 'C2604100';

-- 13번(미해결)
SELECT  CLASS_NAME,
        D.DEPARTMENT_NAME
FROM    TB_CLASS C
JOIN    TB_DEPARTMENT D USING(DEPARTMENT_NO)
WHERE   DEPARTMENT_NO >= 56 AND  DEPARTMENT_NO <= 63;
