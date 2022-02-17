-- 14��(���ذ�, ���ĸ���)
SELECT  STUDENT_NAME �л��̸�,
        P.PROFESSOR_NAME ��������
FROM    TB_STUDENT S
JOIN    TB_PROFESSOR P ON (P.PROFESSOR_NO = S.COACH_PROFESSOR_NO)
WHERE   S.DEPARTMENT_NO = 020
UNION
SELECT  STUDENT_NAME �л��̸�,
        '�������� ������' ��������
FROM    TB_STUDENT S
WHERE   S.DEPARTMENT_NO = 020 AND COACH_PROFESSOR_NO IS NULL;

-- 15��
SELECT  STUDENT_NO �й�,
        STUDENT_NAME �̸�,
        DEPARTMENT_NAME �а��̸�,
        TRUNC(AVG(POINT),2) ����
FROM    TB_STUDENT
JOIN    TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN    TB_GRADE USING(STUDENT_NO)
WHERE   ABSENCE_YN = 'N'
HAVING  AVG(POINT) >= 4
GROUP BY    STUDENT_NO,
            STUDENT_NAME,
            DEPARTMENT_NAME;
            
-- 16��
SELECT  CLASS_NO,
        CLASS_NAME,
        TRUNC(AVG(POINT),2)
FROM    TB_CLASS
JOIN    TB_GRADE USING(CLASS_NO)
WHERE   DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                         FROM   TB_DEPARTMENT
                         WHERE  DEPARTMENT_NAME = 'ȯ�������а�')
        AND SUBSTR(CLASS_TYPE,1,2) = '����'
GROUP BY  CLASS_NO,
          CLASS_NAME;

-- 17��
SELECT  STUDENT_NAME,
        STUDENT_ADDRESS
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                         FROM   TB_STUDENT
                         WHERE  STUDENT_NAME = '�ְ���');
                         
-- 18��(���ذ�)
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
                         WHERE  DEPARTMENT_NAME = '������а�');

            
-- 19��(���ذ�)
SELECT  DEPARTMENT_NAME "�迭 �а���",
        CLASS_NAME
FROM    TB_CLASS
JOIN    TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE   CATEGORY = (SELECT CATEGORY
                    FROM   TB_DEPARTMENT
                    WHERE  DEPARTMENT_NAME = 'ȯ�������а�')
AND     SUBSTR(CLASS_TYPE, 1, 2) = '����'