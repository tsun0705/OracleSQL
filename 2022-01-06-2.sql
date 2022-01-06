-- ȸ�� ���̺� ����
    CREATE TABLE t_member (
        id VARCHAR2(10) PRIMARY KEY,
        pwd VARCHAR2(10),
        name VARCHAR2(50),
        email VARCHAR2(50),
        joinData DATE DEFAULT sysdate
    );
    
-- ȸ�� ���� �߰�
    INSERT INTO t_member VALUES('hong', '1212', 'ȫ�浿', 'hong@gmail.com', sysdate);
    INSERT INTO t_member VALUES('lee', '1212', '�̼���', 'lee@test.com', sysdate);
    INSERT INTO t_member VALUES('kim', '1212', '������', 'kim@jweb.com', sysdate);
    
    COMMIT;
    
    SELECT * FROM t_member;
    
    
-- �Խ��� ���̺� ����
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
        VALUES(1, 0, '�׽�Ʈ���Դϴ�.', '�׽�Ʈ���Դϴ�.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(2, 0, '�ȳ��ϼ���', '��ǰ �ı��Դϴ�.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(3, 2, '�亯�Դϴ�.', '��ǰ �ı⿡ ���� �亯�Դϴ�.', null, sysdate, 'hong');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(5, 3, '�亯�Դϴ�.', '��ǰ �����ϴ�.', null, sysdate, 'lee');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(4, 0, '�������Դϴ�.', '������ �׽�Ʈ���Դϴ�.', null, sysdate, 'kim');
        
    INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedata, id)
        VALUES(6, 2, '��ǰ �ı��Դϴ�..', '�̼��ž��� ��ǰ ��� �ı⸦ �ø��ϴ�!!.', null, sysdate, 'lee');
        
    COMMIT;
    
    SELECT * FROM t_board;