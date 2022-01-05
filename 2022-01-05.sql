SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/HH24:MI') "오늘 날짜",
    SYSDATE+1 "+1",
    SYSDATE-1 "-1",
    TO_DATE('20220105') - TO_DATE('20220101') "날짜 빼기",
    SYSDATE + 13/24 "시간 더하기"
FROM DUAL;    

-- 날짜 함수
    -- MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, ROUND, TRUNC
        
    -- employees 테이블에서 department_id가 100인 직원에 대해 오늘 날짜, hire_date, 오늘 날짜와 hire_data 사이의 개월 수를 출력
    SELECT  SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) "적용 결과" FROM employees WHERE department_id = 100;
    
    -- employees 테이블에서 employee_id가 100과 106 사이의 직원에 hire_date +3개월, -3개월 값 출력
    SELECT hire_date, ADD_MONTHS(hire_date, 3), ADD_MONTHS(hire_date,-3) FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
    -- employees 테이블에서 employee_id가 100과 106 사이의 직원 중 hire_date에서 금요일에 가장 가까운 날짜가 언제인지 문자, 숫자로 출력
    SELECT hire_date, NEXT_DAY(hire_date, '금'), NEXT_DAY(hire_date, 6) FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
     -- employees 테이블에서 employee_id가 100과 106 사이의 직원 중 hire_date를 기준으로 해당 월의 마지막 날짜를 출력
     SELECT hire_date, LAST_DAY(hire_date) FROM employees WHERE employee_id BETWEEN 101 AND 105;
     
    
    -- 날짜의 자리 올림과 절삭
    -- employees 테이블에서 employee_id가 100과 106 사이의 직원 중 hire_date에 대해 연/월 기준 반올림, 절삭을 적용하여 출력
    SELECT hire_date, ROUND(hire_date, 'YEAR'), ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'YEAR'), TRUNC(hire_date, 'MONTH') FROM employees WHERE employee_id BETWEEN 101 AND 105;
    
  
    -- 다양한 날짜 형식 변환
    SELECT TO_CHAR(SYSDATE, 'YY'),
        TO_CHAR(SYSDATE, 'YYYY'),
        TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'MON'),
        TO_CHAR(SYSDATE, 'YYYYMMDD'),
        TO_CHAR(TO_DATE('20220105'), 'YYYYMMDD')
    FROM DUAL;
    
    
    -- 시간 적용
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') 시간형식,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') "시간 + 날짜"
    FROM DUAL;    
       
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') 시간형식,
        TO_CHAR(SYSDATE, '"날짜:" YYYY/MM/DD "시간:" HH:MI:SS PM') "시간 + 날짜"
    FROM DUAL;        
    
    SELECT TO_DATE('20200101', 'YYMMDD')
    FROM DUAL;
    
    -- NULL 값
    -- 0과 공백과 다름, NULL 값을 포함하는 산술 연산의 결과는 NULL
    SELECT * FROM employees ORDER BY commission_pct;
        
    -- NULL 값에 대한 대처방안
    SELECT salary * commission_pct FROM employees ORDER BY commission_pct;
    
    -- NULL이면 일괄적으로 1로 변환하여 salary열과 곱함
    SELECT salary * NVL(commission_pct, 1) FROM employees ORDER BY commission_pct;
    
    -- DECODE => IF-THEN-ELSE-END 조건문으로 인식
    -- DECODE(열이름, 조건 값, 치환 값, 기본 값)
        -- employees 테이블에서 first_name, last_name, department_id, salary를 출력, department_id가 60인 경우 급여 10% 인상한 값으로 계산하여 출력, 나머지 값은 원래의 값 출력, department_id가 60
        SELECT first_name, last_name, department_id, salary 급여, DECODE(department_id, 60, salary * 1.1, salary) 조정된급여, DECODE(department_id, 60, '10% 인상', '미인상') 인상여부 FROM employees; 
        
    
    -- CASE 사용
    -- employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, salary를 출력, salary가 9000 이상이면 '상위급여', 6000과 8999사이면 '중위급여', 그 외에는 '하위급여' 출력
    SELECT employee_id, first_name, last_name, salary,
        CASE
            WHEN salary >= 9000 THEN '상위급여'
            WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
            ELSE '하위급여'
        END AS 급여등급
    FROM employees
    WHERE job_id = 'IT_PROG';
    
    
    -- 데이터 값에 순위
    -- RANK : 공동 순위를 출력, 중복 순위만큼 건너뛰어 다음 순위를 출력
    -- DENSE_RANK : 공동 순위를 출력, 중복 순위 건너뛰지 않고 다음 순위를 출력
    -- ROW_NUMBER : 공동 순위 없이 출력
        -- 위의 3가지 함수를 사용하여 salary 값이 높은 순서대로 순위 출력
        SELECT salary, rank() OVER (ORDER BY salary DESC) "RANK 급여",
            DENSE_RANK() OVER (ORDER BY salary DESC) "DENSE_RANK 급여",
            ROW_NUMBER() OVER (ORDER BY salary DESC) "ROW_NUMBER 급여"
        FROM employees;
        
    
    -- RANK, DENSE_RANK, ROW_NUMBER 함수를 각각 이용해 employees 테이블 직원이 속한 department_id 안에서 salary 값이 높은 순서대로 순위를 매겨 출력
    SELECT A.employee_id,
        A.department_id,
        B.department_name,
        salary,
        rank() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "RANK 급여",
        DENSE_RANK() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "DENSE_RANK 급여",
        ROW_NUMBER() OVER (PARTITION BY A.department_id ORDER BY salary DESC) "ROW_NUMBER 급여"
    FROM employees A, departments B
    WHERE A.department_id = B.department_id
    ORDER BY B.department_id, A.salary DESC;
    
    
-- 그룹함수
    -- SUM, AVG, COUNT, MAX, MIN, GROUP BY
    -- STDDEV : 표준 편차, VARIANCE : 분산
    
    -- employees 테이블에서 salary 행의 수가 몇개 인지 출력
    SELECT COUNT(salary) FROM employees;
        
    -- employees 테이블에서 salary의 합계와 평균을 출력 (평균 함수 사용 X)
    SELECT SUM(salary), AVG(salary), SUM(salary)/COUNT(salary) FROM employees;
    
    -- NULL 값을 포함하여 계산 : AVG(NVL(salary,0))
    
    -- employees 테이블에서 salary의 최대값, 최소값, first_name의 최대값, 최소값을 출력
    SELECT MAX(salary), MIN(salary), MAX(first_name), MIN(first_name) FROM employees;
    
    -- GROUP BY, HAVING
    -- employees 테이블에서 employee_id가 10이상 직원에 대해 job_id별로 그룹화하여 job_id별 총 급여와, 평균 급여, 총 급여 기준으로 내림차순 출력
    SELECT SUM(salary), AVG(salary) FROM employees WHERE employee_id >= 10 GROUP BY job_id  ORDER BY SUM(salary) DESC;
    
    -- GROUP BY 대그룹, 중그룹, 소그룹 형태로 출력
    SELECT job_id job_id_대그룹,
           manager_id manager_id_중그룹,
           SUM(salary), 
           AVG(salary)
    FROM employees 
    WHERE employee_id >= 10 
    GROUP BY job_id, manager_id
    ORDER BY SUM(salary) DESC;
    
    
    -- HAVING을 사용하는 이유 : 그룹화된 값에 대해 조건식을 적용할 수 있음.
    -- employees 테이블에서 employee_id가 10이상 직원에 대해 job_id별로 그룹화하여 job_id별 총 급여와, 평균 급여를 구하고 job_id별 총 급여가 3000보다 큰 값만 출력
    -- job_id별 총 급여 기준으로 내림차순
    SELECT SUM(salary) 총급여, AVG(salary) 평균급여 FROM employees WHERE employee_id >= 10 GROUP BY job_id HAVING SUM(salary) > 3000  ORDER BY 총급여 DESC;