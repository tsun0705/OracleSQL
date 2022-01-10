-- employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION 연산자를 활용하여 출력
SELECT department_id FROM employees 
UNION 
SELECT department_id FROM departments;

-- UNION ALL
SELECT department_id FROM employees 
UNION ALL
SELECT department_id FROM departments;

-- employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 교집합으로 출력
SELECT department_id FROM employees 
INTERSECT
SELECT department_id FROM departments 
ORDER BY department_id;

-- departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을 제거한 데이터를 출력
SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees;


-- 서브쿼리 - SELECT 안에 SELECT문
    -- 단일 행 서브쿼리 : =
        -- employees 테이블의 last_name이 'De Haan'인 직원과 salary가 동일한 직원 정보 출력
        SELECT * FROM employees A WHERE A.salary = 
        ( SELECT salary FROM employees WHERE last_name = 'De Haan');
        
    -- 다중 행 서브쿼리 : IN (중복이 있을 경우)
        SELECT * FROM employees A WHERE A.salary IN
        ( SELECT salary FROM employees WHERE last_name = 'Taylor');
    
        -- 최저 급여 출력
        SELECT * FROM employees A WHERE A.salary IN
        ( SELECT MIN(salary) FROM employees GROUP BY department_id) ORDER BY A.salary;
        
    -- 다중 열 서브쿼리 : 그룹별 급여
    SELECT * FROM employees A WHERE (A.job_id, A.salary) IN
    ( SELECT job_id, MIN(salary) FROM employees GROUP BY job_id) ORDER BY A.salary DESC;    
     
    -- FROM절 서브쿼리 : 인라인 뷰
    -- 직원중에서 department_name이 IT인 직원의 정보를 인라인 뷰를 통해 출력
    SELECT * FROM employees A,
    ( SELECT department_id FROM departments WHERE department_name = 'IT') B WHERE A.department_id = B.department_id;
    
    
    -- DML 삽입/수정/삭제
        -- departments 테이블에 department_id가 271, department_name이 'Sample_Dept' manager_id가 200, location_id가 1700인 행을 삽입
        INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES(271,'Sample_Dept',200,1700);
        
        -- departments 테이블에 department_name이 'Sample_Dept'인 행을 찾아서 manager_id를 201, location_id를 1800으로 변경
        UPDATE departments SET manager_id = 201, location_id = 1800 WHERE department_name = 'Sample_Dept'; 
        
        -- departments 테이블에서 department_id가 40인, manager_id와 location_id의 데이터 값을 찾고, department_name이 'Sample_Dept'인 행의 manager_id와 location_id를 찾아낸 데이터 값과 동일하게 변경
        UPDATE departments SET (manager_id, location_id) = (SELECT manager_id, location_id FROM departments WHERE department_id = 40) WHERE department_name = 'Sample_Dept';
        
        -- departments 테이블에서 department_name이 'Sample_Dept'인 행을 삭제
        DELETE FROM departments WHERE department_name = 'Sample_Dept';