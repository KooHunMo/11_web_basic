/*

	# 제약 조건
	
		- NOT NULL : NULL 금지
		- UNIQUE : 중복값입력 금지(NULL은가능)
		- AUTO_INCREMENT : 인덱스 자동 증가
		- PRIMARY KEY(PK) : 
							테이블에 유일하게 구분되는 키로 주 식별자, 주키 등으로 불린다.
							PRIMARY KEY는 유일한 값이기 때문에 중복된 값을 가질 수 없다.
							기본 키에 입력되는 값은 중복될 수 없으며, NULL 값이 입력될 수 없다.
							PRIMARY KEY 제약 조건을 설정하면, 해당 필드는 NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가진다.
							
		 - FOREIGN KEY(FK)  :
							한 테이블과 참조되는 다른 테이블 간의 연결되는 Primary Key Column을 Foreign Key라 한다.	
							테이블들을 연결해주는 역할을 한다.
							FOREIGN KEY 는 참조관계의 기본 키와 같은 속성을 가진다.
							FOREIGN KEY 는 외부 테이블에서 참고하려는 주 키 (primary key) 를 의미한다.
							외부키, 참조키, 외부 식별자 등으로 불린다.
							'외래 키 테이블'에 데이터를 입력할 때는 꼭 '기준 테이블'을 참조해서 입력하므로 반드시 '기준 테이블'에 존재하는 데이터만 입력이 가능하다.
							'외래 키 테이블'이 참조하는 '기준 테이블'의 열은 반드시 PK이거나 UNIQUE 제약 조건이 설정되어 있어야 한다.
		
        [ 형식 ]
	
		  (CONSTRAINT [CONSTRAINT_NAME]생략가능) FOREIGN KEY (자식 테이블 컬럼 명) REFERENCES 참조테이블(부모 테이블 기본키명) 
		  ON UPDATE 옵션 ON DELETE 옵션
		  
            - 옵션 상세
          
			 CASCADE     : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블에서도 삭제와 수정이 같이 이루어짐
			 SET NULL    : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블의 데이터는 NULL로 변경됨
			 NO ACTION   : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블의 데이터는 변경되지 않음
			 SET DEFAULT : 참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블의 데이터는  필드의 기본값으로 설정
			 RESTRICT    : 참조하는 테이블에 데이터가 남아 있으면 참조되는 테이블의 데이터를 삭제하거나 수정할 수 없음

*/

CREATE TABLE T_SHOPPING_GOODS(
    GOODS_ID 				INT AUTO_INCREMENT PRIMARY KEY,
    GOODS_TITLE 			VARCHAR(50) UNIQUE,
    GOODS_WRITER 			VARCHAR(50),
	GOODS_PRICE 			INT NOT NULL
);


# AUTO_INCREMENT , UNIQUE , NOT NULL 예시
INSERT T_SHOPPING_GOODS VALUES(1,"쉽게배우는 데이터 통신" , "박기현" , 19000);  									# ok
INSERT T_SHOPPING_GOODS VALUES("컴퓨터 활용 능력" , "이주희" , 38000); 		  									# error(컬럼 개수 매치 위반)

INSERT T_SHOPPING_GOODS(GOODS_TITLE , GOODS_WRITER , GOODS_PRICE) VALUES("컴퓨터 활용 능력" , "이주희" , 38000);  # ok
INSERT T_SHOPPING_GOODS(GOODS_TITLE , GOODS_WRITER , GOODS_PRICE) VALUES("컴퓨터 활용 능력" , "이주희2" , 40000); # error(UNIQUE 제약위반)
INSERT T_SHOPPING_GOODS(GOODS_TITLE , GOODS_WRITER , GOODS_PRICE) VALUES("컴퓨터 활용 능력2" , "이주희" , 40000); # ok

INSERT T_SHOPPING_GOODS(GOODS_TITLE , GOODS_PRICE) VALUES("초등학생이 알아야할 숫자" , 22000); 					 # ok
INSERT T_SHOPPING_GOODS(GOODS_TITLE , GOODS_WRITER) VALUES("초등학생이 알아야할 숫자" , "엘리스 제임스"); 			 # error(NOT NULL 제약위반)

SELECT 
		*
FROM 
		T_SHOPPING_GOODS;

# 메인키와 참조키를 사용하지 않았을 경우의 예시
CREATE TABLE T_CLASS1 (
	CLASS_ID    VARCHAR(10),
    CLASS_NAME  VARCHAR(10)
);

CREATE TABLE T_STUDENT1 (
	STUDENT_ID   INT,
    STUDENT_NAME VARCHAR(10),
    CLASS_ID     VARCHAR(10)
);

INSERT INTO T_CLASS1 VALUES("C1" , "DBMS");
INSERT INTO T_CLASS1 VALUES("C2" , "FRONT END");
INSERT INTO T_CLASS1 VALUES("C3" , "BACK END");

INSERT INTO T_STUDENT1 VALUES(1 , "팀 버너스 리" , "C1");
INSERT INTO T_STUDENT1 VALUES(2 , "제임스 고슬링" , "C2");
INSERT INTO T_STUDENT1 VALUES(3 , "데니스리치" , "C3");
INSERT INTO T_STUDENT1 VALUES(4 , "빌게이츠" , "C4");
INSERT INTO T_STUDENT1 VALUES(5 , "스티브 잡스"  , "C5");

SELECT * FROM T_CLASS1;
SELECT * FROM T_STUDENT1;

UPDATE T_CLASS1 SET CLASS_ID = "C100" WHERE CLASS_ID = "C1"; # 성공
DELETE FROM T_CLASS1 WHERE CLASS_ID = "C2";                  # 성공



# 메인키와 참조키를 사용했을 경우의 예시
CREATE TABLE T_CLASS2 (
	CLASS_ID    VARCHAR(10),
    CLASS_NAME  VARCHAR(10),
    PRIMARY KEY(CLASS_ID)      # 메인키 설정
);

CREATE TABLE T_STUDENT2 (
	STUDENT_ID   INT,
    STUDENT_NAME VARCHAR(10),
    CLASS_ID     VARCHAR(10),
    PRIMARY KEY(STUDENT_ID),   
    FOREIGN KEY(CLASS_ID) REFERENCES T_CLASS2(CLASS_ID)   # 참조키 설정
);


INSERT INTO T_CLASS2 VALUES("C1" , "DBMS");
INSERT INTO T_CLASS2 VALUES("C2" , "FRONT END");
INSERT INTO T_CLASS2 VALUES("C3" , "BACK END");

INSERT INTO T_STUDENT2 VALUES(1 , "팀 버너스 리" , "C1");
INSERT INTO T_STUDENT2 VALUES(2 , "제임스 고슬링" , "C2");
INSERT INTO T_STUDENT2 VALUES(3 , "데니스리치" , "C3");
INSERT INTO T_STUDENT2 VALUES(4 , "빌게이츠" , "C4");     # 키 참조 에러 (메인 테이블에 없는 데이터)
INSERT INTO T_STUDENT2 VALUES(5 , "스티브 잡스"  , "C5");  # 키 참조 에러 (메인 테이블에 없는 데이터) 

SELECT * FROM T_CLASS2;
SELECT * FROM T_STUDENT2;

UPDATE T_CLASS2 SET CLASS_ID = "C100" WHERE CLASS_ID = "C1"; # 키 참조 에러(외래키가 참조하고 있을 경우 수정 불가)
DELETE FROM T_CLASS2 WHERE CLASS_ID = "C2";                  # 키 참조 에러(외래키가 참조하고 있을 경우 삭제 불가)



# 메인키와 참조키를 사용했을 경우(옵션 적용)의 예시
CREATE TABLE T_CLASS3 (
	CLASS_ID    VARCHAR(10),
    CLASS_NAME  VARCHAR(10),
    PRIMARY KEY(CLASS_ID)      # 메인키 설정
);

CREATE TABLE T_STUDENT3 (
	STUDENT_ID   INT,
    STUDENT_NAME VARCHAR(10),
    CLASS_ID     VARCHAR(10),
    PRIMARY KEY(STUDENT_ID),   
    FOREIGN KEY(CLASS_ID) REFERENCES T_CLASS3(CLASS_ID) 
    ON UPDATE CASCADE   # 메인키의 테이블을 수정할 경우 참조 테이블의 값도 같이 수정
    ON DELETE SET NULL  # 메인키의 테이블을 삭제할 경우 참조 테이블의 값을 NULL로 수정
);


INSERT INTO T_CLASS3 VALUES("C1" , "DBMS");
INSERT INTO T_CLASS3 VALUES("C2" , "FRONT END");
INSERT INTO T_CLASS3 VALUES("C3" , "BACK END");

INSERT INTO T_STUDENT3 VALUES(1 , "팀 버너스 리" , "C1");
INSERT INTO T_STUDENT3 VALUES(2 , "제임스 고슬링" , "C2");
INSERT INTO T_STUDENT3 VALUES(3 , "데니스리치" , "C3");
INSERT INTO T_STUDENT3 VALUES(4 , "빌게이츠" , "C4");     # 키 참조 에러 (메인 테이블에 없는 데이터)
INSERT INTO T_STUDENT3 VALUES(5 , "스티브 잡스"  , "C5");  # 키 참조 에러 (메인 테이블에 없는 데이터) 

SELECT * FROM T_CLASS3;
SELECT * FROM T_STUDENT3;

UPDATE T_CLASS3 SET CLASS_ID = "C100" WHERE CLASS_ID = "C1";  # 메인테이블과 참조테이블의 값이 모두 수정
UPDATE T_CLASS3 SET CLASS_ID = "C200" WHERE CLASS_ID = "C2";  # 메인테이블과 참조테이블의 값이 모두 수정
DELETE FROM T_CLASS3 WHERE CLASS_ID = "C3";          		  # 메인테이블의 값은 삭제 참조테이블의값은 NULL로 수정        




