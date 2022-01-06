-- 테이블 생성    
    CREATE TABLE sample_product (
        product_id NUMBER,
        product_name VARCHAR2(30),
        manu_data DATE
    );    

-- 데이터 삽입    
    INSERT INTO sample_product VALUES(1, 'televison', to_date('140101', 'YYMMDD'));
    INSERT INTO sample_product VALUES(2, 'washer', to_date('150101', 'YYMMDD'));
    INSERT INTO sample_product VALUES(3, 'cleaner', to_date('160101', 'YYMMDD'));
    
-- 필드 추가
    ALTER TABLE sample_product ADD (factory varchar(10));
   
-- 필드 변경
    ALTER TABLE sample_product MODIFY (product_name varchar(5)); -- 적재된 데이터의 크기보다 작게 설정하면 오류 발생
    
    ALTER TABLE sample_product MODIFY (product_name varchar(35));
    
    ALTER TABLE sample_product RENAME COLUMN factory TO factory_name;
    
-- 필드 삭제
    ALTER TABLE sample_product DROP COLUMN factory_name;
    
-- 테이블 구조는 그대로 두고 내용만 삭제
    TRUNCATE TABLE sample_product;
    
-- 테이블 삭제
    DROP TABLE sample_product;
    
    COMMIT;