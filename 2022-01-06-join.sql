-- INNER JOIN
    -- 두 테이블을 합쳐서 출력
        SELECT * FROM employees A, departments B WHERE A.department_id = B.department_id;
    
    -- employees 테이블과 departments 테이블과 locations 테이블을 조인하여 각 직원이 어느 부서에 속하는지, 부서의 소재지가 어디인지 확인
        SELECT a.employee_id, a.department_id, B.department_name, C.location_id, c.city
        FROM employees A, departments B, locations C
        WHERE a.department_id = b.department_id AND b.location_id = c.location_id;
        
-- OUTER JOIN
    SELECT COUNT(*) "조인된 건수" FROM employees A, departments B WHERE a.department_id = b.department_id;
    
    -- employees 테이블과 departments 테이블을 department_id로 외부 조인하여 department_id가 null값인 데이터도 함께 출력
    SELECT a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
    FROM employees A, departments B 
    WHERE a.department_id = b.department_id(+) -- (+) = 데이터 값이 부족한 테이블에 null값을 갖는 행이 생성되어 조인됨
    ORDER BY a.employee_id;
    
-- SELF JOIN
    SELECT a.employee_id, a.first_name, a.last_name, a.manager_id, b.first_name || ' ' || b.last_name manager_name
    FROM employees A, employees B
    WHERE a.manager_id = b.employee_id
    ORDER BY a.employee_id;
    