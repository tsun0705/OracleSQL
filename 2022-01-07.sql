-- employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION �����ڸ� Ȱ���Ͽ� ���
SELECT department_id FROM employees 
UNION 
SELECT department_id FROM departments;

-- UNION ALL
SELECT department_id FROM employees 
UNION ALL
SELECT department_id FROM departments;

-- employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ ���������� ���
SELECT department_id FROM employees 
INTERSECT
SELECT department_id FROM departments 
ORDER BY department_id;

-- departments ���̺��� department_id ���տ��� employees ���̺��� department_id ������ ������ �����͸� ���
SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees;


-- �������� - SELECT �ȿ� SELECT��
    -- ���� �� �������� : =
        -- employees ���̺��� last_name�� 'De Haan'�� ������ salary�� ������ ���� ���� ���
        SELECT * FROM employees A WHERE A.salary = 
        ( SELECT salary FROM employees WHERE last_name = 'De Haan');
        
    -- ���� �� �������� : IN (�ߺ��� ���� ���)
        SELECT * FROM employees A WHERE A.salary IN
        ( SELECT salary FROM employees WHERE last_name = 'Taylor');
    
        -- ���� �޿� ���
        SELECT * FROM employees A WHERE A.salary IN
        ( SELECT MIN(salary) FROM employees GROUP BY department_id) ORDER BY A.salary;
        
    -- ���� �� �������� : �׷캰 �޿�
    SELECT * FROM employees A WHERE (A.job_id, A.salary) IN
    ( SELECT job_id, MIN(salary) FROM employees GROUP BY job_id) ORDER BY A.salary DESC;    
     
    -- FROM�� �������� : �ζ��� ��
    -- �����߿��� department_name�� IT�� ������ ������ �ζ��� �並 ���� ���
    SELECT * FROM employees A,
    ( SELECT department_id FROM departments WHERE department_name = 'IT') B WHERE A.department_id = B.department_id;
    
    
    -- DML ����/����/����
        -- departments ���̺� department_id�� 271, department_name�� 'Sample_Dept' manager_id�� 200, location_id�� 1700�� ���� ����
        INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES(271,'Sample_Dept',200,1700);
        
        -- departments ���̺� department_name�� 'Sample_Dept'�� ���� ã�Ƽ� manager_id�� 201, location_id�� 1800���� ����
        UPDATE departments SET manager_id = 201, location_id = 1800 WHERE department_name = 'Sample_Dept'; 
        
        -- departments ���̺��� department_id�� 40��, manager_id�� location_id�� ������ ���� ã��, department_name�� 'Sample_Dept'�� ���� manager_id�� location_id�� ã�Ƴ� ������ ���� �����ϰ� ����
        UPDATE departments SET (manager_id, location_id) = (SELECT manager_id, location_id FROM departments WHERE department_id = 40) WHERE department_name = 'Sample_Dept';
        
        -- departments ���̺��� department_name�� 'Sample_Dept'�� ���� ����
        DELETE FROM departments WHERE department_name = 'Sample_Dept';