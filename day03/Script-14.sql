-- 서브쿼리

SELECT EMPNO, ENAME, (SELECT DNAME FROM DEPT D WHERE D.DEPTNO = E.DEPTNO) DNAME
FROM EMP E;

SELECT AVG(SAL)FROM EMP WHERE DEPTNO=20;

SELECT * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP  WHERE DEPTNO=20);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

SELECT * FROM EMP WHERE SAL NOT IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO); -- 최대 급여 제외하고 

SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30; -- 30번 부서 사원들의 최대 급여

SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- 30번 부서 사원들의 최대 급여보다 작은 급여 받는 사람

SELECT * FROM EMP WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); -- 위에 줄이랑 똑같음


SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30; -- 30번 부서에서 적은 급여 알게됨

-- 부서 번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력하기
SELECT * FROM EMP WHERE SAL < (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);

SELECT * FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

SELECT SAL FROM EMP WHERE DEPTNO=30 ORDER BY SAL DESC; 

SELECT * FROM EMP WHERE EXISTS (SELECT * FROM DEPT WHERE DEPTNO=40);

SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO); -- 타 부서의 직원도 같이 나오는

SELECT * FROM EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO); 


SELECT EMPNO, ENAME, JOB
FROM (SELECT EMPNO, ENAME, JOB FROM EMP WHERE DEPTNO IN (20,30)) E
WHERE E.JOB IN ('SALESMAN', 'MANAGER');


WITH E AS (SELECT EMPNO, ENAME, JOB FROM EMP WHERE DEPTNO IN(20,30))
SELECT EMPNO, ENAME, JOB
FROM E
WHERE E.JOB IN ('SALESMAN', 'MANAGER');

















