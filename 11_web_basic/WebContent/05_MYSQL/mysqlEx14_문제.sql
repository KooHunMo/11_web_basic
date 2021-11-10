CREATE TABLE T_MEMBER(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NAME 	VARCHAR(50),
	MEMBER_GENDER 	VARCHAR(10),
	HP 				VARCHAR(20),
	EMAIL 			VARCHAR(20),
    REGIDENCE		VARCHAR(20),
    PRIMARY KEY (MEMBER_ID)   
);

CREATE TABLE T_PRODUCT(
    PRODUCT_CODE 			VARCHAR(20),
    PRODUCT_NAME 			VARCHAR(100),
	PRODUCT_PRICE 			INT,
	PRODUCT_DELIVERY_PRICE 	INT,
    PRIMARY KEY (PRODUCT_CODE)    
);

CREATE TABLE T_ORDER(
	ORDER_CODE 			VARCHAR(50),
    MEMBER_ID 			VARCHAR(50),
    PRODUCT_CODE		VARCHAR(20),
	ORDER_GOODS_QTY 	INT,
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATE 		VARCHAR(100),
	ORDER_DATE 			DATE,
    PRIMARY KEY (ORDER_CODE),
    FOREIGN KEY(MEMBER_ID) REFERENCES T_MEMBER(MEMBER_ID),
    FOREIGN KEY(PRODUCT_CODE) REFERENCES T_PRODUCT(PRODUCT_CODE)
);

INSERT INTO T_MEMBER VALUES('user1', '메르켈' , 'f' , '010-1111-1111' , 'mer@gmail.com'  , '서울');
INSERT INTO T_MEMBER VALUES('user2', '제임스고슬링' , 'm' , '010-2222-2222' , 'james@gmail.com' , '서울'); 
INSERT INTO T_MEMBER VALUES('user3', '신사임당' , 'f' , '010-3333-3333' , 'shinsa@naver.com' , '경기');
INSERT INTO T_MEMBER VALUES('user4', '유관순' , 'f' , '010-4444-4444' , 'yks@gmail.com' , '인천');
INSERT INTO T_MEMBER VALUES('user5', '데니스리치' , 'm' , '010-5555-5555' , 'denis@gmail.com' , '부산');
INSERT INTO T_MEMBER VALUES('user6', '팀버너스리' , 'm' , '010-6666-6666' , 'tim@naver.com' , '대구');
INSERT INTO T_MEMBER VALUES('user7', '스티븐워즈니악' , 'm' , '010-7777-7777' , 'stevenw@gmail.com' , '경기');
INSERT INTO T_MEMBER VALUES('user8', '선덕여왕' , 'f' , '010-8888-8888' , 'seonduk@gmail.com' , '서울');
INSERT INTO T_MEMBER VALUES('user9', '스티브잡스' , 'm' , '010-9999-9999' , 'jobs@daum.net' , '부산');
INSERT INTO T_MEMBER VALUES('user10', '빌게이츠' , 'm' , '010-1010-1010' , 'bill@naver.com' , '서울');

INSERT INTO T_PRODUCT VALUES('product1', '삼성전자 2021 노트북 플러스2 15.6' , 598000 , 0 );    
INSERT INTO T_PRODUCT VALUES('product2', '삼성전자 2021 갤럭시북 15.6' , 1208000 , 0 );
INSERT INTO T_PRODUCT VALUES('product3', 'LG전자 10세대 코어i7 윈10탑재 17형 LG 그램 2020년형 17Z90N' , 2149000 , 0);
INSERT INTO T_PRODUCT VALUES('product4', 'LG전자 2021그램 360 14' , 1740000 , 0 );
INSERT INTO T_PRODUCT VALUES('product5', 'LG전자 2020 울트라 PC 14' , 477000 , 0 );
INSERT INTO T_PRODUCT VALUES('product6', '2020 맥북 프로 13' , 2129650 , 3000 );
INSERT INTO T_PRODUCT VALUES('product7', 'Apple 2020 맥북 에어 13' , 1489800 , 3000 );
INSERT INTO T_PRODUCT VALUES('product8', '레노버 2021 IdeaPad Slim3 15.6' , 2129650 , 2500 );
INSERT INTO T_PRODUCT VALUES('product9', '기가바이트 2021 Gaming G5 15.6' , 1499000 , 2500 );
INSERT INTO T_PRODUCT VALUES('product10', 'HP 2021 노트북 15s' , 768840 , 2500 );

INSERT INTO T_ORDER VALUES('order1', 'user1' , 'product1' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-01-03');
INSERT INTO T_ORDER VALUES('order2', 'user1' , 'product2' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-02-25');
INSERT INTO T_ORDER VALUES('order3', 'user1' , 'product3' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-03-12');
INSERT INTO T_ORDER VALUES('order4', 'user5' , 'product8' ,  2 , '배송전 연락 주세요.' ,  '배송중' , '2019-04-11');
INSERT INTO T_ORDER VALUES('order5', 'user6' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-05-30');
INSERT INTO T_ORDER VALUES('order6', 'user3' , 'product1' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-06-01');
INSERT INTO T_ORDER VALUES('order7', 'user2' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-07-12');
INSERT INTO T_ORDER VALUES('order8', 'user10' , 'product1' ,  10 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-12-25');
INSERT INTO T_ORDER VALUES('order9', 'user9' , 'product2' ,  2 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송중' , '2020-01-07');
INSERT INTO T_ORDER VALUES('order10', 'user5' , 'product10' , 1 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-02-28');
INSERT INTO T_ORDER VALUES('order11', 'user7' , 'product4' , 1 , '경비실에 맡겨 주세요.' , '배송완료' , '2020-03-03');
INSERT INTO T_ORDER VALUES('order12', 'user2' , 'product4' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-04-27');
INSERT INTO T_ORDER VALUES('order13', 'user8' , 'product3' , 1 , '배송전 연락 주세요' , '배송완료' , '2020-05-05');
INSERT INTO T_ORDER VALUES('order14', 'user9' , 'product7' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-05-08');
INSERT INTO T_ORDER VALUES('order15', 'user3' , 'product2' , 3 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-06-27');
INSERT INTO T_ORDER VALUES('order16', 'user3' , 'product9' , 10 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-07-08');
INSERT INTO T_ORDER VALUES('order17', 'user4' , 'product7' , 7 ,  '경비실에 맡겨 주세요.' , '배송중' , '2020-08-15');
INSERT INTO T_ORDER VALUES('order18', 'user6' , 'product6' , 3 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-10-03');
INSERT INTO T_ORDER VALUES('order19', 'user7' , 'product6' , 12 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-11-11');
INSERT INTO T_ORDER VALUES('order20', 'user10' , 'product8' , 5 , '배송전 연락 주세요' , '배송중' , '2020-12-20');



# 문제 1) 한번에 주문 수량이 10개 이상인 상품 정보 모두와 주문수량 조회하기.



# 문제 2) 2020년 동안 판매된 매출총액 조회하기.(가격 * 개수 + 배송비)



# 문제 3) '상품별'로 2020년 동안 판매된 수량(내림차순)순으로 정렬하여  상품코드 , 상품이름 , 상품판매량 조회하기.



# 문제 4) '지역별'로 판매량이 많은 순서대로 정렬하여 지역명과 판매량 조회하기.



# 문제 5) 배송이 완료된 상품의 회원테이블의 모든 정보와 배송상태 조회하기.



# 문제 6) '배송이 완료되지 않은 상품'별로  상품코드 , 상품 이름 , 배송이 완료되지 않은 주문 건수 조회하기.



# 문제 7) '상품별'로 상품코드,상품이름,판매금액 총합을 판매급액이 많은 순으로 조회하기. 



# 문제 8) '메르켈' 회원의 주문 상품 이름과 배송상태를 조회하기.



# 문제 9) '메르켈' 회원의 주문금액 총합을 조회하기.



# 문제 10 ) '사용자'별로 사용자 아이디 , 사용자 이름 , 주문금액 총합을 조회 하기.



# 문제 11) '사용자'별로 주문금액 총합이 1000만원 이상인 회원의 이름을 오름차순으로 정렬하여 조회하기.



# 문제 12) '사용자'별로 주문금액 총합이 가장 많은 사람 3명의 이름과 총 주문 금액을 순서대로 조회하기.


