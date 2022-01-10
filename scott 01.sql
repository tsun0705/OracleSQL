SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- EMP 테이블에서 부서번호를 중복 제거하고 출력
SELECT DISTINCT DEPTNO FROM EMP;

-- EMP 테이블에서 부서번호, 직업 중복 제거하고 출력
SELECT DISTINCT job, deptno FROM EMP;

-- EMP 테이블에서 부서번호, 직업 중복을 포함하여 출력
SELECT ALL job, deptno FROM emp;

-- EMP 테이블의 모든 열의 급여 기준으로 내림차순 정렬
SELECT * FROM EMP ORDER BY SAL DESC;