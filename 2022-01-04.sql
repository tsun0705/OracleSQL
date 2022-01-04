-- 테이블 출력, VIEW도 포함
 SELECT * FROM TAB; 
 
-- EMPLOYEES 테이블의 모든 필드 출력
SELECT * FROM employees;

-- 중복된 데이터 제거
SELECT DISTINCT job_id FROM employees; 

-- AS를 사용하여 별칭 지정
SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성 FROM employees; 

-- 필드 연결 ||
SELECT employee_id AS 사원번호,  (last_name || first_name) AS 이름 FROM employees; 

-- 문구 붙이기
SELECT employee_id AS 사원번호, (last_name || ' ' || first_name ) AS 이름, (email || '@' || 'naver.com') AS 이메일 FROM employees;

-- 산술 연산
    -- EMPLOYEES 테이블에서 employee_id, salary, salary에 500을 더한 값, 100을 뺀 값, 10%를 추가해서 2로 나눈 값을 출력
    -- 띄어쓰기 넣을 시 " "로 묶기
    SELECT employee_id AS 사원번호, salary AS 급여, salary + 500 AS "추가 급여", salary - 500 AS "인하 급여", (salary  * 1.1)/2 AS "조정 급여" FROM employees;

-- WHERE 조건 
    -- employee_id가 100인 직원 정보를 출력
    SELECT * FROM employees WHERE employee_id = 100; 

    -- EMPLOYEES 테이블에서 first_name 이 David인 직원 정보 출력
    SELECT * FROM employees WHERE first_name = 'David';

    -- EMPLOYEES 테이블에서 employee_id가 105 이상인 직원 정보 출력
    SELECT * FROM employees WHERE employee_id >= 105; 
    
    -- EMPLOYEES 테이블에서 salary가 10,000 이상이고 20,000 이하인 직원 정보 출력
    SELECT * FROM employees WHERE salary >= 10000 AND salary <= 20000;
    SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;
    
    -- EMPLOYEES 테이블에서 salary가 10000, 17000, 24000인 정보를 출력
    SELECT * FROM employees WHERE salary IN (10000, 17000, 24000);
    
    -- EMPLOYEES 테이블에서 job_id값이 AD를 포함하는 모든 데이터 조회
    SELECT * FROM employees WHERE job_id LIKE '%AD%';
    
    -- EMPLOYEES 테이블에서 job_id값이 AD를 포함하며 글자 수를 제한하는 데이터 조회
    SELECT * FROM employees WHERE job_id LIKE 'AD___'; -- AD로 시작하며 뒤에 세글자가 오는 데이터 출력
    
    -- EMPLOYEES 테이블에서 manager_id가 NULL값인 직원 정보 출력
    SELECT * FROM employees WHERE manager_id IS NULL;
    
    -- EMPLOYEES 테이블에서 salary가 4000을 초과하면서 job_id가 IT_PROG인 값을 조회
    SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG';
    
    -- EMPLOYEES 테이블에서 salary가 4000을 초과하면서 job_id가 IT_PROG거나 FI_ACCOUNT인 경우
    SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';
    
    -- EMPLOYEES 테이블에서 employee_id가 105가 아닌 직원을 조회
    SELECT * FROM employees WHERE employee_id <> 105; 
    
-- 문자열 함수 (FUNCTION)
    -- EMPLOYEES 테이블에서 last_name을 소문자와 대문자를 각각 출력하고, email의 첫 번째 문자는 대문자로 출력
    SELECT LOWER(last_name), UPPER(last_name), INITCAP(email) FROM employees;
    
    -- EMPLOYEES 테이블에서 job_id 데이터 값의 첫 번째 자리부터 시작해서 두 개의 문자를 출력
    SELECT SUBSTR(job_id,1,2) FROM employees;
    
    -- EMPLOYEES 테이블에서 job_id 문자열 값이 ACCOUNT를 ACCNT로 출력
    SELECT REPLACE(job_id,'ACCOUNT','ACCNT') FROM employees;
    
    -- EMPLOYEES 테이블에서 first_name에 12자리의 문자열을 만들되 first_name의 데이터 값이 작으면 왼쪽부터 *를 출력
    SELECT LPAD(first_name, 12, '*') FROM employees;
    
-- 숫자열 함수 (FUNCTION)
    -- EMPLOYEES 테이블에서 salary를 30일로 나눈 후 나눈 값의 소수점 첫째 자리, 소수점 둘째 자리, 정수 첫째 자리에서 반올림한 값 출력
    SELECT salary/30 일급, ROUND(salary/30,0) "적용결과 0", ROUND(salary/30,1) "적용결과 1", ROUND(salary/30,-1) "적용결과 -1" FROM employees;