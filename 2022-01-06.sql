-- ���̺� ����    
    CREATE TABLE sample_product (
        product_id NUMBER,
        product_name VARCHAR2(30),
        manu_data DATE
    );    

-- ������ ����    
    INSERT INTO sample_product VALUES(1, 'televison', to_date('140101', 'YYMMDD'));
    INSERT INTO sample_product VALUES(2, 'washer', to_date('150101', 'YYMMDD'));
    INSERT INTO sample_product VALUES(3, 'cleaner', to_date('160101', 'YYMMDD'));
    
-- �ʵ� �߰�
    ALTER TABLE sample_product ADD (factory varchar(10));
   
-- �ʵ� ����
    ALTER TABLE sample_product MODIFY (product_name varchar(5)); -- ����� �������� ũ�⺸�� �۰� �����ϸ� ���� �߻�
    
    ALTER TABLE sample_product MODIFY (product_name varchar(35));
    
    ALTER TABLE sample_product RENAME COLUMN factory TO factory_name;
    
-- �ʵ� ����
    ALTER TABLE sample_product DROP COLUMN factory_name;
    
-- ���̺� ������ �״�� �ΰ� ���븸 ����
    TRUNCATE TABLE sample_product;
    
-- ���̺� ����
    DROP TABLE sample_product;
    
    COMMIT;