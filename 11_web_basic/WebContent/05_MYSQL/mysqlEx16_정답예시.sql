#문제 1) 부서번호가 D001인 부서의 사원번호와 사원의 이름을 조회하기.

SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT
						EMP_NO
					FROM
							DEPT_EMP
					WHERE 
							DEPT_NO = 'D001');



# 문제 2) 1960년 이후에 태어난 사원들이 근무하고 사원들의 사원번호, 근무부서 번호를 가져온다.

SELECT
		EMP_NO,
        DEPT_NO
FROM
		DEPT_EMP
WHERE
		EMP_NO IN (SELECT
						EMP_NO
				   FROM
							EMPLOYEES
				   WHERE
							BIRTH_DATE >= '1960-01-01');
  
  
  
# 문제 3) 직급이 Senior Engineer인 사원의 이름을 조회하기.

SELECT
		FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT 
							EMP_NO
					FROM 
							TITLES
					WHERE
							TITLE = 'Senior Engineer');
  
  
  
# 문제 4) Development부서의 성별의 수를 조회하기

SELECT 
		GENDER,
		COUNT(GENDER)
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (
					SELECT 
							EMP_NO
					FROM
							DEPT_EMP
					WHERE
							DEPT_NO = (SELECT 
												DEPT_NO
										FROM	
												departments
										WHERE
												DEPT_NAME = 'Development'))
GROUP BY
		GENDER;
