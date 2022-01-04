-- ���̺� ���, VIEW�� ����
 SELECT * FROM TAB; 
 
-- EMPLOYEES ���̺��� ��� �ʵ� ���
SELECT * FROM employees;

-- �ߺ��� ������ ����
SELECT DISTINCT job_id FROM employees; 

-- AS�� ����Ͽ� ��Ī ����
SELECT employee_id AS �����ȣ, first_name AS �̸�, last_name AS �� FROM employees; 

-- �ʵ� ���� ||
SELECT employee_id AS �����ȣ,  (last_name || first_name) AS �̸� FROM employees; 

-- ���� ���̱�
SELECT employee_id AS �����ȣ, (last_name || ' ' || first_name ) AS �̸�, (email || '@' || 'naver.com') AS �̸��� FROM employees;

-- ��� ����
    -- EMPLOYEES ���̺��� employee_id, salary, salary�� 500�� ���� ��, 100�� �� ��, 10%�� �߰��ؼ� 2�� ���� ���� ���
    -- ���� ���� �� " "�� ����
    SELECT employee_id AS �����ȣ, salary AS �޿�, salary + 500 AS "�߰� �޿�", salary - 500 AS "���� �޿�", (salary  * 1.1)/2 AS "���� �޿�" FROM employees;

-- WHERE ���� 
    -- employee_id�� 100�� ���� ������ ���
    SELECT * FROM employees WHERE employee_id = 100; 

    -- EMPLOYEES ���̺��� first_name �� David�� ���� ���� ���
    SELECT * FROM employees WHERE first_name = 'David';

    -- EMPLOYEES ���̺��� employee_id�� 105 �̻��� ���� ���� ���
    SELECT * FROM employees WHERE employee_id >= 105; 
    
    -- EMPLOYEES ���̺��� salary�� 10,000 �̻��̰� 20,000 ������ ���� ���� ���
    SELECT * FROM employees WHERE salary >= 10000 AND salary <= 20000;
    SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;
    
    -- EMPLOYEES ���̺��� salary�� 10000, 17000, 24000�� ������ ���
    SELECT * FROM employees WHERE salary IN (10000, 17000, 24000);
    
    -- EMPLOYEES ���̺��� job_id���� AD�� �����ϴ� ��� ������ ��ȸ
    SELECT * FROM employees WHERE job_id LIKE '%AD%';
    
    -- EMPLOYEES ���̺��� job_id���� AD�� �����ϸ� ���� ���� �����ϴ� ������ ��ȸ
    SELECT * FROM employees WHERE job_id LIKE 'AD___'; -- AD�� �����ϸ� �ڿ� �����ڰ� ���� ������ ���
    
    -- EMPLOYEES ���̺��� manager_id�� NULL���� ���� ���� ���
    SELECT * FROM employees WHERE manager_id IS NULL;
    
    -- EMPLOYEES ���̺��� salary�� 4000�� �ʰ��ϸ鼭 job_id�� IT_PROG�� ���� ��ȸ
    SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG';
    
    -- EMPLOYEES ���̺��� salary�� 4000�� �ʰ��ϸ鼭 job_id�� IT_PROG�ų� FI_ACCOUNT�� ���
    SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';
    
    -- EMPLOYEES ���̺��� employee_id�� 105�� �ƴ� ������ ��ȸ
    SELECT * FROM employees WHERE employee_id <> 105; 
    
-- ���ڿ� �Լ� (FUNCTION)
    -- EMPLOYEES ���̺��� last_name�� �ҹ��ڿ� �빮�ڸ� ���� ����ϰ�, email�� ù ��° ���ڴ� �빮�ڷ� ���
    SELECT LOWER(last_name), UPPER(last_name), INITCAP(email) FROM employees;
    
    -- EMPLOYEES ���̺��� job_id ������ ���� ù ��° �ڸ����� �����ؼ� �� ���� ���ڸ� ���
    SELECT SUBSTR(job_id,1,2) FROM employees;
    
    -- EMPLOYEES ���̺��� job_id ���ڿ� ���� ACCOUNT�� ACCNT�� ���
    SELECT REPLACE(job_id,'ACCOUNT','ACCNT') FROM employees;
    
    -- EMPLOYEES ���̺��� first_name�� 12�ڸ��� ���ڿ��� ����� first_name�� ������ ���� ������ ���ʺ��� *�� ���
    SELECT LPAD(first_name, 12, '*') FROM employees;
    
-- ���ڿ� �Լ� (FUNCTION)
    -- EMPLOYEES ���̺��� salary�� 30�Ϸ� ���� �� ���� ���� �Ҽ��� ù° �ڸ�, �Ҽ��� ��° �ڸ�, ���� ù° �ڸ����� �ݿø��� �� ���
    SELECT salary/30 �ϱ�, ROUND(salary/30,0) "������ 0", ROUND(salary/30,1) "������ 1", ROUND(salary/30,-1) "������ -1" FROM employees;