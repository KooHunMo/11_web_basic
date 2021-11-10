/*

		# 실습환경 셋팅

			1) TEST_DB 데이터 베이스 생성 및 사용
			
			2) EMP 테이블 생성	
				EMPNO 정수 			  # 사번
				ENAME 문자열(20)		  # 이름
				JOB 문자열(20)		  # 직책
				HIREDATE 문자열(20)	  # 입사일자
				SAL 정수				  # 월급				
				COMM 정수			  # 커미션
				DEPTNO 정수			  # 부서번호
                
			3) 실습 데이터 insert
*/

# 1) TEST_DB 데이터 베이스 생성 및 사용
CREATE DATABASE TEST_DB;
USE TEST_DB;

# 2) EMP 테이블 생성
CREATE TABLE EMP(

	EMPNO INT,
	ENAME VARCHAR(20),
	JOB VARCHAR(20),
	HIREDATE VARCHAR(30),
	SAL INT,
	COMM INT,
	DEPTNO INT

);


# 3) 실습 데이터 삽입 insert
INSERT INTO EMP VALUES (7369,'SMITH','CLERK','17-12-1980',800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN','20-2-1981',1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN','22-2-1981',1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER','2-4-1981',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN','28-9-1981',1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER','1-5-1981',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER','9-6-1981',2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST','13-7-1987',3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT','17-11-1981',5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN','8-9-1981',1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK','13-7-1987',1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK','3-12-1981',950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST','3-12-1981',3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK','23-1-1982',1300,NULL,10);


/*

	# 연습 예제
						
		1) 사원 테이블의 모든 레코드를 조회하시오.
        
        
		2) 사원명과 입사일을 조회하시오.
        
        
		3) 사원번호와 이름을 조회하시오.
        
        
		4) 사원테이블에 있는 직책의 목록(중복제거)을 조회하시오.
        
        
		5) 부서번호가 10인 사원을 조회하시오.
        
        
		6) 월급여가 2500이상 되는 사원을 조회하시오.
        
        
		7) 이름이 'KING'인 사원을 조회하시오.
        
        
		8) 사원중 이름이 s로 시작하는 사원의 사원번호와 이름을 조회하시오.
        
        
		9) 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오.
        
        
		10) 커미션이 300,500,1400인 사원의 사번,이름,커미션을 조회하시오.
        
        
		11) 월급여가 1200에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오.	 
        
        
		12) 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.
        
        
		13) 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오.
        
        
		14) 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오.
        
        
		15) 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오.
        
        
		16) 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오.


		17) 총 사원수를 조회하시오.


		18) 부서별 평균월급여를 조회하시오.		


		19) 부서별 최대 급여와 최소 급여를 조회하시오.


		20) 부서별로 급여 평균을 조회하시오. (단, 부서별 급여 평균이 2000 이상만)


		21) 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하시오. (단, 평균값이 2000 이상인 레코드만 구하시오.)


		22) 급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 알파벳이 빠른 사원순으로 사번,이름,월급여를 조회하시오.

*/