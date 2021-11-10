/* 

	# SQL (Structured Query Language)
	
		- SQL(Structured Query Language)은 관계형 데이터베이스 관리 시스템(RDBMS)의 데이터를 관리하기 위해 설계된 특수 목적의 프로그래밍 언어이다. 
		
		- 관계형 데이터베이스 관리 시스템에서 자료의 검색과 관리, 데이터베이스 스키마 생성과 수정, 데이터베이스 객체 접근 조정 관리를 위해 고안되었다. 
		
		- 많은 수의 데이터베이스 관련 프로그램들이 SQL을 표준으로 채택하고 있다.
		
		- 데이터베이스 언어 SQL 문법의 종류는 다음 세 가지로 구별된다.
		
			1) 데이터 정의 언어 (DDL : Data Definition Language)   Ex) Create , Drop , Alter 
			2) 데이터 조작 언어 (DML : Data Manipulation Language) Ex) Select , Insert , Update , Delete 
			3) 데이터 제어 언어 (DCL : Data Control Language)	   Ex) Commit , Rollback, 

*/
			
	
/*

	[ 데이터 베이스 생성 형식 ]
	
		- CREATE DATABASE DB_NAME;

		EX) CREATE DATABASE BMS;

*/				
CREATE DATABASE TEST_DB;

/*
	
    [ 데이터 베이스 사용 형식 ]
		
        - USE DB_NAME;
			
		EX) USE BMS;

*/
USE TEST_DB;


/*

	[ 테이블 생성 형식 ]

	- CREATE TABLE TABLE_NAME(FIELD1 TYPE, FIELD2 TYPE , .....);
	- 테이블명은 관용적으로 앞에 T_를 붙인다.
	- 데이터 타입
		숫자 : INT
		문자열 : VARCHAR(최대길이) 
			최대길이를 초과할 수 없으며 최대길이보다 적은 데이터가 입력되면 입력된 데이터만큼의 자원이 할당된다.
			""  , '' 모두 사용가능하다.
        실수  : DOUBLE
		문자  : CHAR
     
	   EX)
	   CREATE TABLE T_ADMIN_GOODS (
			NO INT,
			NAME VARCHAR (15),
			PHONE VARCHAR (15)
	   );
*/
CREATE TABLE MEMBER(
	
    NUM    INT, 
    NAME   VARCHAR(10),
    HEIGHT DOUBLE,
    WEIGHT DOUBLE,
    GENDER CHAR,
    MEMO   VARCHAR(50)
    
);


/*

	[ 테이블 관련 정보 확인 명령어 ]
	
    - DESC TABLE_NAME;
    
    EX) DESC T_SHOPPING_GOODS;
    
*/ 
DESC MEMBER;


/*

	[ 레코드(데이터) 추가 형식 ]
   
	- INSERT INTO TABLE_NAME(FIELD1,FIELD2,....) VALUES('VAL1','VAL2',....);
	- 모든 컬럼의 데이터가 입력되면 필드명 입력을 생략할수 있다.
   
   EX) 
		INSERT INTO MEMBER(NO,NAME,PHONE) VALUES('1','JAMES','111-111');    # 모든 필드의 데이터가 입력
		INSERT INTO MEMBER VALUES('1','JAMES','111-111');					# 모든 필드의 데이터가 입력되어 필드명을 생략
		INSERT INTO MEMBER(NAME) VALUES('JOHN');							# 특정 필드의 데이터만 입력
			
	
*/
INSERT INTO 
		MEMBER(NUM , NAME, HEIGHT , WEIGHT , GENDER , MEMO) 
VALUES
		(1 , '김철수' , 180.3 , 80.3 , 'm' , '남자사람');

INSERT INTO
		MEMBER 
VALUES
		(2 , '이영희' , 170.3 , 50.3 , 'f' , '여자사람');

INSERT INTO
		MEMBER(NUM , NAME)
VALUES
		(3 , '팀 버너스 리');




/*

	[ 레코드 출력 형식 ]
    
   - SELECT  FIELD1, FIELD2, ...  FROM TABLE_NAME [WHERE 조건절]

   EX)
	   1) 전체 컬럼 조회
	   SELECT  
				* 
	   FROM 
				MEMBER;
	   
	   2) 특정 컬럼 조회
	   SELECT 
				NO,
				NAME 
		FROM 
				MEMBER;

*/
SELECT
		*
FROM 
		MEMBER;

SELECT 
		NAME, 
		HEIGHT, 
		WEIGHT
FROM
		MEMBER;
		
/*
	 참고) mysqlWorkbench
     
     - mysqlWorkBench에서 safe update 정책으로 update와 delete를 막아 놓았다.
     
		> 좌측 상단 edit 클릭 
        > preferences 클릭
        > SQL editor 클릭 
        > 하단의 Safty Updates 체크박스 해지
		> mysqlworkbench 재시작
        
      이후 update문 및 delete문 사용 가능

*/
	
/*

	[ 레코드 수정 형식 ]
    
   - UPDATE TABLE SET FIELD_NAME='NEW_VALUE' WHERE FIELD_CONDITION='DATA';
   
   - 대부분 where절과 같이 사용한다.
  
  EX) 
		UPDATE 
				MEMBER 
		SET 
				NAME = 'JACKSON', 
				HEIGHT = '185.1' 
		WHERE 
				NO = 3;

*/
UPDATE 
		MEMBER 
SET 
		HEIGHT = 181.3, 
        WEIGHT = 90.2
WHERE
		NAME = '김철수';


  
/*

   [ 레코드 삭제 형식 ]
   
    - DELETE FROM TABLE WHERE FIELD_CONDITION='DATA';
    
    - 대부분 where절과 같이 사용한다.
    
	EX) 
		DELETE FROM 
					MEMBER 
		WHERE 
					NO=1;

*/
DELETE FROM 
		MEMBER 
WHERE 
		NUM = 3;


/*

    # commit : 트렌젝션을 데이터베이스에 반영한다.
		
        - 반드시 커밋 명령어를 실행 해야 트렌젝션(변경)이 database에 적용 된다.
        - commit명령어를 사용하지 않으면 , 현재 연결상태에서만 변경사항이 보이는 것이고 재접속을 할 경우 변경했던 내용이 반영이 되어있지 않다.
		- 기본적으로 autocommit설정이 되어있는데 중요한 서버(운영)에는 autocommit 설정을 걸지 않는다.
		- autocommit 여부를 항상 확인해야된다. (에디터 마다 다름) 
          mysqlworkbench : edit> sql execution > new connections us auto commit mode)

    # rollback : 이전 커밋시점으로 회귀한다.

*/	

/*
			
	[ 테이블 삭제 형식 ]
	- DROP TABLE TABLE_NAME;

*/
DROP TABLE MEMBER;

	
/*
	
	[ 데이터 베이스 삭제 형식 ]
	- DROP DATABASE DB_NAME;
		
		EX) DROP DATABASE TEST_DB;
*/
DROP DATABASE TEST_DB;

/*	
			
	 +@) 단축키 
	 
	 1) 실행 : 마우스 블록 + CTRL + ENTER
	 2) 대문자 전환 : CTRL + SHFIT + U
	 3) 쿼리 정렬 : CTRL + B
         
*/