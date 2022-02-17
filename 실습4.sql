-- 14번(미해결, 정렬못함)
SELECT  STUDENT_NAME 학생이름,
        P.PROFESSOR_NAME 지도교수
FROM    TB_STUDENT S
JOIN    TB_PROFESSOR P ON (P.PROFESSOR_NO = S.COACH_PROFESSOR_NO)
WHERE   S.DEPARTMENT_NO = 020
UNION
SELECT  STUDENT_NAME 학생이름,
        '지도교수 미지정' 지도교수
FROM    TB_STUDENT S
WHERE   S.DEPARTMENT_NO = 020 AND COACH_PROFESSOR_NO IS NULL;

-- 15번
SELECT  STUDENT_NO 학번,
        STUDENT_NAME 이름,
        DEPARTMENT_NAME 학과이름,
        TRUNC(AVG(POINT),2) 평점
FROM    TB_STUDENT
JOIN    TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN    TB_GRADE USING(STUDENT_NO)
WHERE   ABSENCE_YN = 'N'
HAVING  AVG(POINT) >= 4
GROUP BY    STUDENT_NO,
            STUDENT_NAME,
            DEPARTMENT_NAME;
            
-- 16번
SELECT  CLASS_NO,
        CLASS_NAME,
        TRUNC(AVG(POINT),2)
FROM    TB_CLASS
JOIN    TB_GRADE USING(CLASS_NO)
WHERE   DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                         FROM   TB_DEPARTMENT
                         WHERE  DEPARTMENT_NAME = '환경조경학과')
        AND SUBSTR(CLASS_TYPE,1,2) = '전공'
GROUP BY  CLASS_NO,
          CLASS_NAME;

-- 17번
SELECT  STUDENT_NAME,
        STUDENT_ADDRESS
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                         FROM   TB_STUDENT
                         WHERE  STUDENT_NAME = '최경희');
                         
-- 18번(미해결)
SELECT  STUDENT_NO,
        STUDENT_NAME
FROM    TB_GRADE
JOIN    TB_STUDENT USING(STUDENT_NO)
GROUP BY    STUDENT_NO,
            STUDENT_NAME
HAVING  AVG(POINT) = (SELECT     MAX(AVG(POINT))
                        FROM       TB_GRADE
                        GROUP BY   STUDENT_NO)
WHERE   STUDENT_NO IN   (SELECT DEPARTMENT_NO
                         FROM   TB_DEPARTMENT
                         WHERE  DEPARTMENT_NAME = '국어국문학과');

            
-- 19번(미해결)
SELECT  DEPARTMENT_NAME "계열 학과명",
        CLASS_NAME
FROM    TB_CLASS
JOIN    TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE   CATEGORY = (SELECT CATEGORY
                    FROM   TB_DEPARTMENT
                    WHERE  DEPARTMENT_NAME = '환경조경학과')
AND     SUBSTR(CLASS_TYPE, 1, 2) = '전공'