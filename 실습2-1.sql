-- 10번
SELECT  DEPARTMENT_NO 학과번호,
        COUNT(*) "학생수(명)"
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    1;

-- 12번
SELECT  SUBSTR(TERM_NO, 1, 4) 년도,
        ROUND(AVG(POINT),1) "년도 별 평점"
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A112113'
GROUP BY    SUBSTR(TERM_NO, 1, 4);

-- 13번ㄴ
SELECT  DEPARTMENT_NO 학과코드명,
        COUNT(ABSENCE_YN) "휴학생 수"
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    DEPARTMENT_NO;

-- 14번ㄴ
SELECT  STUDENT_NAME 동일이름,
        COUNT(STUDENT_NAME = STUDENT_NAME) "동명인 수"
FROM    TB_STUDENT
GROUP BY    STUDENT_NAME, COUNT(STUDENT_NAME = STUDENT_NAME);

-- 15번
SELECT  SUBSTR(TERM_NO, 1, 4) 년도,
        SUBSTR(TERM_NO, 5, 2) 학기,
        ROUND(AVG(POINT),1) 평점
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A112113'
GROUP BY    ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2));