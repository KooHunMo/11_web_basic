# 문제 1) 한번에 주문 수량이 10개 이상인 상품 정보 테이블의 컬럼 모두 조회하기.
              
SELECT
		*
FROM
		T_PRODUCT 
WHERE 
		PRODUCT_CODE IN (SELECT 
								PRODUCT_CODE
						FROM
								T_ORDER 
						WHERE 
								ORDER_GOODS_QTY >= 10) ;     



# 문제 2) 한번에 제일 많은 수량을 주문한 주문 코드 조회하기.

SELECT
		ORDER_CODE
FROM
		T_ORDER
WHERE
		ORDER_GOODS_QTY = (SELECT 
									MAX(ORDER_GOODS_QTY) 
							FROM 
									T_ORDER);



# 문제 3) 한번에 제일 많은 수량을 주문한 상품명 조회하기.

SELECT
		PRODUCT_NAME
FROM
		T_PRODUCT
WHERE
		PRODUCT_CODE = (SELECT
								PRODUCT_CODE
						FROM
								T_ORDER
						WHERE
								ORDER_GOODS_QTY = (SELECT 
															MAX(ORDER_GOODS_QTY) 
													FROM 
															T_ORDER));        
		
        
        
# 문제 4) 한번에 제일 많은 수량을 주문한 유저의 모든 정보 조회하기.

SELECT
		*
FROM
		T_MEMBER
WHERE
		MEMBER_ID = (SELECT
							MEMBER_ID
					FROM
							T_ORDER
					WHERE
							ORDER_GOODS_QTY = (SELECT 
														MAX(ORDER_GOODS_QTY) 
												FROM 
														T_ORDER));       
                            
                                
                                
# 문제 5) 배송이 완료된 상품의 회원테이블의 모든 정보 조회하기.

SELECT
		*
FROM
		T_MEMBER 
WHERE
		MEMBER_ID IN (SELECT 
							MEMBER_ID 
					  FROM 
							T_ORDER 
					  WHERE 
							DELIVERY_STATE = '배송완료');



# 문제 6) 배송이 완료되지 않은 상품의 상품명 조회하기.

SELECT
		PRODUCT_NAME
FROM
		T_PRODUCT 
WHERE
		PRODUCT_CODE IN (SELECT 
								PRODUCT_CODE 
						FROM 
								T_ORDER 
						WHERE 
								DELIVERY_STATE <> '배송완료');


# 문제 7) '메르켈' 회원이 주문한 상품 코드와 주문상품 명을 조회하기.

SELECT
		PRODUCT_CODE,
		PRODUCT_NAME
FROM 
		T_PRODUCT
WHERE
		PRODUCT_CODE IN (SELECT
								PRODUCT_CODE
						FROM 
								T_ORDER
						WHERE 
								MEMBER_ID = (SELECT
													MEMBER_ID
											FROM
													T_MEMBER
											WHERE	
													MEMBER_NAME = "메르켈")) ;


# 문제 8) '메르켈' 회원의 총 주문수량을 조회하기.

SELECT
		SUM(ORDER_GOODS_QTY)
FROM
		T_ORDER
WHERE 
		MEMBER_ID = (SELECT
							MEMBER_ID
					FROM
							T_MEMBER
					WHERE
							MEMBER_NAME = "메르켈");
  
  
  
# 문제 9) 서울지역의 모든 제품의 판매수량의 총합을 조회하기.

SELECT
		SUM(ORDER_GOODS_QTY)
FROM
		T_ORDER
WHERE
		MEMBER_ID IN (SELECT
								MEMBER_ID
					  FROM
								T_MEMBER
					  WHERE
								REGIDENCE = '서울');



# 문제 10) 삼성전자 2021 노트북 플러스2 15.6이 판매된 지역을 조회하기.

SELECT DISTINCT
		REGIDENCE
FROM
		T_MEMBER
WHERE
		MEMBER_ID IN (SELECT
							MEMBER_ID
					FROM
							T_ORDER
					WHERE 
							PRODUCT_CODE = (SELECT
													PRODUCT_CODE
											FROM
													T_PRODUCT
											WHERE
													PRODUCT_NAME = '삼성전자 2021 노트북 플러스2 15.6'));



# 문제 11) 2020년 동안 판매된 상품의 양이 5개 미만인 상품 이름 조회하기.

SELECT
		PRODUCT_NAME
FROM
		T_PRODUCT
WHERE
		PRODUCT_CODE IN (SELECT 
								PRODUCT_CODE
						FROM 
								T_ORDER 
						WHERE 
								ORDER_DATE between '2020-01-01' and '2020-12-31'
						GROUP BY 
								PRODUCT_CODE 
						HAVING
								SUM(ORDER_GOODS_QTY) < 5);
                                
                                

# 문제 12) user4가 주문한 주문보다 주문을 많이 한 회원의 아이디와 주문개수를 조회하기.

SELECT
		MEMBER_ID,
		SUM(ORDER_GOODS_QTY) AS TOTAL_ORDER
FROM
		T_ORDER
GROUP BY
		MEMBER_ID
HAVING
		TOTAL_ORDER > (SELECT 
								SUM(ORDER_GOODS_QTY) 
						FROM 
								T_ORDER 
						WHERE 
								MEMBER_ID = 'USER4');