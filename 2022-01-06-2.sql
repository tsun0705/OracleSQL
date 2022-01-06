-- 회원 테이블 생성
    CREATE TABLE t_member (
        id VARCHAR2(10) PRIMARY KEY,
        pwd VARCHAR2(10),
        name VARCHAR2(50),
        email VARCHAR2(50),
        joinData DATE DEFAULT sysdate
    );
    
-- 회원 정보 추가
    INSERT INTO t_member VALUES('hong', '1212', '홍길동', 'hong@gmail.com', sysdate);
    INSERT INTO t_member VALUES('lee', '1212', '이순신', 'lee@test.com', sysdate);
    INSERT INTO t_member VALUES('kim', '1212', '김유신', 'kim@jweb.com', sysdate);
    
    COMMIT;
    
    SELECT * FROM t_member;
    
    
-- 게시판 테이블 생성
    CREATE TABLE t_Board (
        articleNO NUMBER(10) PRIMARY KEY,
        parentNO NUMBER(10) DEFAULT 0,
        title VARCHAR2(500) not null,
        content VARCHAR2(4000),
        imageFileName VARCHAR2(100),
        writedata DATE DEFAULT sysdate NOT NULL,
        id VARCHAR2(10),
        CONSTRAINT FK_ID FOREIGN KEY(id) REFERENCES t_member(id)
    );
    
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(1, 0, '테스트글입니다.', '테스트글입니다.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(2, 0, '안녕하세요', '상품 후기입니다.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(5, 3, '답변입니다.', '상품 좋습니다.', null, sysdate, 'lee');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(4, 0, '김유신입니다.', '김유신 테스트글입니다.', null, sysdate, 'kim');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(6, 2, '상품 후기입니다..', '이순신씨의 상품 사용 후기를 올립니다!!.', null, sysdate, 'lee');
        
    COMMIT;
    
    SELECT * FROM t_board;