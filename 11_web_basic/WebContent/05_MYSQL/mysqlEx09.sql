/*
   
		 # 집계함수 
		 
			 1) COUNT : 조회될 데이터들의 개수를 가져온다.
			 2) SUM   : 조회될 데이터들의 합을 가져온다.
			 3) AVG   : 조회될 데이터들의 평균을 가져온다.
			 4) MAX   : 조회될 데이터들의 최대값을 가져온다.
			 5) MIN   : 조회될 데이터들의 최소값을 가져온다.
         
         
         #  GROUP BY
         
			- 출력된 레코드를 그룹으로 묶고 각 그룹에대한 요약 값을 계산한다. ( 집계함수랑 같이 사용해야 한다. )
				
			[ 형식 ]
                
			SELECT 
				집계함수(<필드명>) 
			FROM 
				<테이블명> 
            GROUP BY 
				<필드명> 
			
                            
		 # HAVING
			
            - GROUP BY문법에 조건식을 추가할경우 HAVING을 사용한다.
        
			[ 형식 ]
                
			SELECT 
				집계함수(<필드명>) 
			FROM 
				<테이블명> 
			{WHERE					생략가능
				<조건식>}
            GROUP BY 
				<필드명> 
			HAVING 
				<GROUP BY조건>
        
 */	

# 예시 1) 전체 사원의 숫자를 조회하기.
SELECT
		COUNT(*)
FROM
		EMPLOYEES;

	
# 예시 2) 전체 사원의 최고 급여 조회하기.
SELECT
		MAX(SALARY)
FROM
		SALARIES;


# 예시 3) 전체 사원의 최저 급여 조회하기.
SELECT
		MIN(SALARY)
FROM
		SALARIES;

		
# 예시 4) 전체 사원의 직원들의 성별의 수를 조회하기.
SELECT
		GENDER,
		COUNT(*)
FROM	
		EMPLOYEES
GROUP BY
		GENDER;


	
# 예시 5) 각부서별로 인원수를 조회하기.
SELECT
		DEPT_NO,
		COUNT(*)
FROM
		DEPT_EMP
GROUP BY
		DEPT_NO;
        
 
 
# 예시 6) 5만명 이상이 사용하고 있는 직함의 이름과 직원의 수.
SELECT
		TITLE,
		COUNT(*)
FROM
		TITLES
GROUP BY
		TITLE
HAVING
		COUNT(*) > 50000;

	
# WHERE COUNT(*) > 50000   # WHERE절에서 집계함수 적용 불가

