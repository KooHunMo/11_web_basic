# 문제 1) d003부서가 아닌 매니저들의 사원번호 , 부서번호를 조회하기.

SELECT 
		EMP_NO ,
		DEPT_NO 
FROM 
		DEPT_MANAGER
WHERE 
		DEPT_NO <> 'D003';



# 문제 2) 급여가 150000이상인 사원들의 사원번호 , 급여를 조회하기.

SELECT
		EMP_NO ,
		SALARY
FROM 
		SALARIES
WHERE 
		SALARY >= 150000;



# 문제 3) 급여가 100000이하인 사원들의 사원번호 , 급여를 조회하기.

SELECT 
		EMP_NO ,
		SALARY
FROM 
		SALARIES
WHERE 
		SALARY <= 100000;
	
    
    
# 문제 4) 1990년 이후부터 매니저로 근무 하고 있는 사원들의 사원번호 , 부서번호 , 매니저 시작날짜 조회하기.

SELECT 
		EMP_NO ,
		DEPT_NO ,
		FROM_DATE
FROM 
		DEPT_MANAGER
WHERE 
		FROM_DATE >= '1990-01-01';

	
	
# 문제 5) 1990년 이전에 입사한 사원들의 사원번호 , 입사일 조회하기.

SELECT  
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		HIRE_DATE < '1990-01-01';
		
		
		
# 문제 6) 1990년 이후에 입사한 남자사원의 사원번호 , 성별 , 입사일 조회하기.

SELECT 
		EMP_NO, 
	    GENDER, 
	    HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		GENDER = 'M' AND HIRE_DATE >= '1990-01-01';



# 문제 7) 1990년 이후부터 60000이상의 급여를 받는 사원의 사원번호 , 급여 날짜 조회하기.

SELECT 
	    EMP_NO, 
	    SALARY
FROM
    	SALARIES
WHERE
    	FROM_DATE >= '1990-01-01' AND SALARY >= 60000;



# 문제 8) d001부서와 d002부서 매니저의 사원번호 , 부서번호 조회하기.
		
SELECT 
	    EMP_NO, 
	    DEPT_NO
FROM
   	 	DEPT_MANAGER
WHERE
    	DEPT_NO = 'D001' OR DEPT_NO = 'D002';	



# 문제 9) 직함이 Staff인 사원과 Engineer인 사원의 사원번호 , 직함을 조회하기.

SELECT 
	    EMP_NO, 
	    TITLE
FROM
    	TITLES
WHERE
    	TITLE = 'STAFF' OR TITLE = 'ENGINEER';



# 문제 10) d003부서만 제외한 매니저의 사원번호 , 부서번호를 조회하기.

SELECT 
	    EMP_NO, 
	    DEPT_NO
FROM
   		DEPT_MANAGER
WHERE
    	NOT DEPT_NO = 'D003';
		
	

# 문제 11) 이름에 'o' 가 포함되어 있는 사원의 사원번호 , 이름을 조회하기.

SELECT 
		EMP_NO ,
		FIRST_NAME
FROM 
		EMPLOYEES
WHERE 
		FIRST_NAME LIKE '%o%';

	
	
# 문제 12) 이름에 'o' 가 포함되어 있고 마지막글자가 'o'가 아닌 사원의 사원번호 , 이름을 조회하기.

SELECT 
		EMP_NO ,
		FIRST_NAME
FROM 
		EMPLOYEES
WHERE 
		FIRST_NAME LIKE '%o%' AND NOT FIRST_NAME LIKE '%o';
        
        

# 문제 13) 사원 번호와 입사일을 조회하기 (입사일이 빠른 사람 기준)

SELECT 
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
ORDER BY 
		HIRE_DATE DESC;



# 문제 14) 사원의 번호와 이름을 조회하기. (알파벳 순서 기준)  / 조건) first_name이 k 로 시작하는 사원들.

SELECT 
	    EMP_NO, 
	    FIRST_NAME,
	    LAST_NAME
FROM
    	EMPLOYEES
WHERE
    	FIRST_NAME LIKE 'k%'
ORDER BY 
		LAST_NAME;



# 문제 15) 사원 번호와 입사일을 조회하기. (입사일이 늦은 기준)  / 조건) 1990년에 입사한 사원들.

SELECT 
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		HIRE_DATE BETWEEN '1990-01-01' AND '1990-12-31'
ORDER BY 
		HIRE_DATE DESC;