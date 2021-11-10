# 1) 사원 테이블의 모든 레코드를 조회하시오.

SELECT 
   	 *
FROM
    	EMP;
    
SELECT 
	    EMPNO, 
	    ENAME, 
	    JOB,  
	    HIREDATE, 
	    SAL, 
	    COMM, 
	    DEPTNO
FROM
   	 	EMP;



# 2) 사원명과 입사일을 조회하시오.

SELECT 
	    ENAME, 
	    HIREDATE
FROM
   		 EMP;



# 3) 사원번호와 이름을 조회하시오.	

SELECT 
	    DEPTNO, 
	    ENAME
FROM
    	EMP;



# 4) 사원테이블에 있는 직책의 목록(중복제거)을 조회하시오.

SELECT DISTINCT
    	JOB
FROM
    	EMP;



# 5) 부서번호가 10인 사원을 조회하시오.

SELECT 
    	*
FROM
    	EMP
WHERE
    	DEPTNO = 20;



# 6) 월급여가 2500이상 되는 사원을 조회하시오.

SELECT 
    	*
FROM
    	EMP
WHERE
    	SAL >= 2500;



# 7) 이름이 'KING'인 사원을 조회하시오.

SELECT 
   	 	*
FROM
    	EMP
WHERE
    	ENAME = 'KING';



# 8) 사원중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME
FROM
    	EMP
WHERE
    	ENAME LIKE 'S%';



# 9) 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME
FROM
   		EMP
WHERE
    	ENAME LIKE '%T%';



# 10) 커미션이 300,500,1400인 사원의 사번,이름,커미션을 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME, 
	    COMM
FROM
    	EMP
WHERE
    	COMM = 300 OR COMM = 500 OR COMM = 1400;


SELECT 
	    EMPNO, 
	    ENAME, 
	    COMM
FROM
   	 	EMP
WHERE
    	COMM IN (300 , 500, 1400);


# 11) 월급여가 1200에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오.  
  
SELECT 
	    EMPNO, 
	    ENAME, 
	    SAL
FROM
    	EMP
WHERE
    	SAL >= 1200 AND SAL <= 3500;
    
    
SELECT 
	    EMPNO, 
	    ENAME, 
	    SAL
FROM
    	EMP
WHERE
   		SAL BETWEEN 1200 AND 3500;



# 12) 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.

SELECT 
	    ENAME, 
	    EMPNO, 
	    JOB, 
	    DEPTNO
FROM
    	EMP
WHERE
    	DEPTNO = 30 AND JOB = 'MANAGER';



# 13) 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME, 
	    DEPTNO
FROM
    	EMP
WHERE
    	NOT DEPTNO = 30;



# 14) 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME, 
	    COMM
FROM
   	 	EMP
WHERE
    	COMM NOT IN (300 , 500, 1400);



# 15) 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME
FROM
    	EMP
WHERE
    	ENAME NOT LIKE '%S%';



# 16) 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오.

SELECT 
	    EMPNO, 
	    ENAME, 
	    SAL
FROM
    	EMP
WHERE
    	SAL NOT BETWEEN 1200 AND 3700;



# 17) 총 사원수를 구하시오.

SELECT 
    	COUNT(EMPNO)
FROM
    	EMP;



# 18) 부서별 평균월급여를 조회하시오.
#SELECT DEPTNO,AVG(SAL) FROM EMP (X);

SELECT 
    	DEPTNO, 
    	AVG(SAL)
FROM
    	EMP
GROUP BY 
		DEPTNO;
		
        

# 19) 부서별 최대 급여와 최소 급여를 조회하시오.
SELECT 
	    DEPTNO, 
	    MAX(SAL), 
	    MIN(SAL)
FROM
    	EMP
GROUP BY 
		DEPTNO;



# 20) 부서별로 급여 평균을 조회하시오. (단, 부서별 급여 평균이 2000 이상만)
#SELECT DEPTNO,AVG(SAL) FROM EMP WHERE AVG(SAL) >= 2000; GROUP BY DEPTNO; (X)

SELECT 
	    DEPTNO, 
	    AVG(SAL)
FROM
    	EMP
GROUP BY 
		DEPTNO
HAVING 
		AVG(SAL) >= 2000;



# 21) 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 조회하시오. (단, 평균값이 2000 이상인 레코드만 구하시오.)

SELECT 
	    DEPTNO, 
	    AVG(SAL)
FROM
    	EMP
WHERE
    	SAL >= 1000
GROUP BY 
		DEPTNO
HAVING 
		AVG(SAL) >= 2000;



# 22) 급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 알파벳이 빠른 사원순으로 사번,이름,월급여를 조회하시오. 

SELECT 
	    EMPNO, 
	    ENAME, 
	    SAL
FROM
   		EMP
ORDER BY 
		SAL DESC,
	    ENAME ASC;		