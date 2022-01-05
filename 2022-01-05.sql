SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/HH24:MI') "���� ��¥",
    SYSDATE+1 "+1",
    SYSDATE-1 "-1",
    TO_DATE('20220105') - TO_DATE('20220101') "��¥ ����",
    SYSDATE + 13/24 "�ð� ���ϱ�"
FROM DUAL;    

-- ��¥ �Լ�
    -- MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, ROUND, TRUNC
        
    -- employees ���̺��� department_id�� 100�� ������ ���� ���� ��¥, hire_date, ���� ��¥�� hire_data ������ ���� ���� ���
    SELECT  SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) "���� ���" FROM employees WHERE department_id = 100;
    
    -- employees ���̺��� employee_id�� 100�� 106 ������ ������ hire_date +3����, -3���� �� ���
    SELECT hire_date, ADD_MONTHS(hire_date, 3), ADD_MONTHS(hire_date,-3) FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
    -- employees ���̺��� employee_id�� 100�� 106 ������ ���� �� hire_date���� �ݿ��Ͽ� ���� ����� ��¥�� �������� ����, ���ڷ� ���
    SELECT hire_date, NEXT_DAY(hire_date, '��'), NEXT_DAY(hire_date, 6) FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
     -- employees ���̺��� employee_id�� 100�� 106 ������ ���� �� hire_date�� �������� �ش� ���� ������ ��¥�� ���
     SELECT hire_date, LAST_DAY(hire_date) FROM employees WHERE employee_id BETWEEN 101 AND 105;
     
    
    -- ��¥�� �ڸ� �ø��� ����
    -- employees ���̺��� employee_id�� 100�� 106 ������ ���� �� hire_date�� ���� ��/�� ���� �ݿø�, ������ �����Ͽ� ���
    SELECT hire_date, ROUND(hire_date, 'YEAR'), ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'YEAR'), TRUNC(hire_date, 'MONTH') FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
  
    -- �پ��� ��¥ ���� ��ȯ
    SELECT TO_CHAR(SYSDATE, 'YY'),
        TO_CHAR(SYSDATE, 'YYYY'),
        TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'MON'),
        TO_CHAR(SYSDATE, 'YYYYMMDD'),
        TO_CHAR(TO_DATE('20220105'), 'YYYYMMDD')
    FROM DUAL;
    
    
    -- �ð� ����
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') �ð�����,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') "�ð� + ��¥"
    FROM DUAL;    
       
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') �ð�����,
        TO_CHAR(SYSDATE, '"��¥:" YYYY/MM/DD "�ð�:" HH:MI:SS PM') "�ð� + ��¥"
    FROM DUAL;        
    
    SELECT TO_DATE('20200101', 'YYMMDD')
    FROM DUAL;
    
    -- NULL ��
    -- 0�� ����� �ٸ�, NULL ���� �����ϴ� ��� ������ ����� NULL
    SELECT * FROM employees ORDER BY commission_pct;
        
    -- NULL ���� ���� ��ó���
    SELECT salary * commission_pct FROM employees ORDER BY commission_pct;
    
    -- NULL�̸� �ϰ������� 1�� ��ȯ�Ͽ� salary���� ����
    SELECT salary * NVL(commission_pct, 1) FROM employees ORDER BY commission_pct;
    
    -- DECODE => IF-THEN-ELSE-END ���ǹ����� �ν�
    -- DECODE(���̸�, ���� ��, ġȯ ��, �⺻ ��)
        -- employees ���̺��� first_name, last_name, department_id, salary�� ���, department_id�� 60�� ��� �޿� 10% �λ��� ������ ����Ͽ� ���, ������ ���� ������ �� ���, department_id�� 60
        SELECT first_name, last_name, department_id, salary �޿�, DECODE(department_id, 60, salary * 1.1, salary) �����ȱ޿�, DECODE(department_id, 60, '10% �λ�', '���λ�') �λ󿩺� FROM employees; 
        
    
    -- CASE ���
    -- employees ���̺��� job_id�� IT_PROG��� employee_id, first_name, last_name, salary�� ���, salary�� 9000 �̻��̸� '�����޿�', 6000�� 8999���̸� '�����޿�', �� �ܿ��� '�����޿�' ���
    SELECT employee_id, first_name, last_name, salary,
        CASE
            WHEN salary >= 9000 THEN '�����޿�'
            WHEN salary BETWEEN 6000 AND 8999 THEN '�����޿�'
            ELSE '�����޿�'
        END AS �޿����
    FROM employees
    WHERE job_id = 'IT_PROG';
    
    
    -- ������ ���� ����
    -- RANK : ���� ������ ���, �ߺ� ������ŭ �ǳʶپ� ���� ������ ���
    -- DENSE_RANK : ���� ������ ���, �ߺ� ���� �ǳʶ��� �ʰ� ���� ������ ���
    -- ROW_NUMBER : ���� ���� ���� ���
        -- ���� 3���� �Լ��� ����Ͽ� salary ���� ���� ������� ���� ���
        SELECT salary, rank() OVER (ORDER BY salary DESC) "RANK �޿�",
            DENSE_RANK() OVER (ORDER BY salary DESC) "DENSE_RANK �޿�",
            ROW_NUMBER() OVER (ORDER BY salary DESC) "ROW_NUMBER �޿�"
        FROM employees;
        
    
    -- RANK, DENSE_RANK, ROW_NUMBER �Լ��� ���� �̿��� employees ���̺� ������ ���� department_id �ȿ��� salary ���� ���� ������� ������ �Ű� ���
    SELECT A.employee_id,
        A.department_id,
        B.department_name,
        salary,
        rank() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "RANK �޿�",
        DENSE_RANK() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "DENSE_RANK �޿�",
        ROW_NUMBER() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "ROW_NUMBER �޿�"
    FROM employees A, departments B
    WHERE A.department_id = B.department_id
    ORDER BY B.department_id, A.salary DESC;
    
    
-- �׷��Լ�
    -- SUM, AVG, COUNT, MAX, MIN, GROUP BY
    -- STDDEV : ǥ�� ����, VARIANCE : �л�
    
    -- employees ���̺��� salary ���� ���� � ���� ���
    SELECT COUNT(salary) FROM employees;
        
    -- employees ���̺��� salary�� �հ�� ����� ��� (��� �Լ� ��� X)
    SELECT SUM(salary), AVG(salary), SUM(salary)/COUNT(salary) FROM employees;
    
    -- NULL ���� �����Ͽ� ��� : AVG(NVL(salary,0))
    
    -- employees ���̺��� salary�� �ִ밪, �ּҰ�, first_name�� �ִ밪, �ּҰ��� ���
    SELECT MAX(salary), MIN(salary), MAX(first_name), MIN(first_name) FROM employees;
    
    -- GROUP BY, HAVING
    -- employees ���̺��� employee_id�� 10�̻� ������ ���� job_id���� �׷�ȭ�Ͽ� job_id�� �� �޿���, ��� �޿�, �� �޿� �������� �������� ���
    SELECT SUM(salary), AVG(salary) FROM employees WHERE employee_id >= 10 GROUP BY job_id  ORDER BY SUM(salary) DESC;
    
    -- GROUP BY ��׷�, �߱׷�, �ұ׷� ���·� ���
    SELECT job_id job_id_��׷�,
           manager_id manager_id_�߱׷�,
           SUM(salary), 
           AVG(salary)
    FROM employees 
    WHERE employee_id >= 10 
    GROUP BY job_id, manager_id
    ORDER BY SUM(salary) DESC;
    
    
    -- HAVING�� ����ϴ� ���� : �׷�ȭ�� ���� ���� ���ǽ��� ������ �� ����.
    -- employees ���̺��� employee_id�� 10�̻� ������ ���� job_id���� �׷�ȭ�Ͽ� job_id�� �� �޿���, ��� �޿��� ���ϰ� job_id�� �� �޿��� 3000���� ū ���� ���
    -- job_id�� �� �޿� �������� ��������
    SELECT SUM(salary) �ѱ޿�, AVG(salary) ��ձ޿� FROM employees WHERE employee_id >= 10 GROUP BY job_id HAVING SUM(salary) > 3000  ORDER BY �ѱ޿� DESC;