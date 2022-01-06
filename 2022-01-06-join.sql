-- INNER JOIN
    -- �� ���̺��� ���ļ� ���
        SELECT * FROM employees A, departments B WHERE A.department_id = B.department_id;
    
    -- employees ���̺�� departments ���̺�� locations ���̺��� �����Ͽ� �� ������ ��� �μ��� ���ϴ���, �μ��� �������� ������� Ȯ��
        SELECT a.employee_id, a.department_id, B.department_name, C.location_id, c.city
        FROM employees A, departments B, locations C
        WHERE a.department_id = b.department_id AND b.location_id = c.location_id;
        
-- OUTER JOIN
    SELECT COUNT(*) "���ε� �Ǽ�" FROM employees A, departments B WHERE a.department_id = b.department_id;
    
    -- employees ���̺�� departments ���̺��� department_id�� �ܺ� �����Ͽ� department_id�� null���� �����͵� �Բ� ���
    SELECT a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
    FROM employees A, departments B 
    WHERE a.department_id = b.department_id(+) -- (+) = ������ ���� ������ ���̺� null���� ���� ���� �����Ǿ� ���ε�
    ORDER BY a.employee_id;
    
-- SELF JOIN
    SELECT a.employee_id, a.first_name, a.last_name, a.manager_id, b.first_name || ' ' || b.last_name manager_name
    FROM employees A, employees B
    WHERE a.manager_id = b.employee_id
    ORDER BY a.employee_id;
    