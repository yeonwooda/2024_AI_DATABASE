SELECT * FROM EMP;

SELECT ENAME, UPPER(LOWER(ENAME)), INITCAP(LOWER(ENAME)) FROM EMP; 

SELECT SUM(SAL) FROM EMP; 

SELECT LENGTH('안녕하세요.') FROM DUAL;
 
SELECT LENGTH ('안녕하세요.') "문자 갯수", LENGTHB('안녕하세요.') "바이트 수" FROM DUAL;

SELECT ENAME, SUBSTR(ENAME,2,3) FROM EMP; -- 2번째 위치부터 3개의 문자를 추출해서 가져옴
SELECT ENAME, 
SUBSTR(ENAME,2,3),
SUBSTR(ENAME, 2)FROM EMP;-- 2번째 위치부터 끝까지 문자를 추출해서 가져옴 

SELECT ENAME , INSTR(ENAME, 'S') FROM EMP;
-- 이름 S가 포함된 직원 목록 ENAME LIKE '%S'할 수 도 잇지만
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') >0; -- 도 가능해근데 윗줄이 더 많이 쓰지만 이렇게도 가능

SELECT REPLACE('010-3481-2101', '-', ' ') FROM DUAL;

SELECT LPAD('10', 5, 0) FROM DUAL;
SELECT RPAD('10', 5, 0) FROM DUAL;


SELECT RPAD(SUBSTR('010-3481-2101',1,9), LENGTH('010-3481-2101'), '*')
FROM DUAL;

SELECT EMPNO, ENAME, JOB, CONCAT(CONCAT(ENAME,' : '), JOB) "직원명:직책" FROM EMP; 

SELECT EMPNO, ENAME, JOB, EMPNO || ':' || ENAME || ':' || JOB "사원번호:직원명:직책" FROM EMP;


SELECT TRIM(BOTH '_' FROM '      A______') || 'B' FROM DUAL;
SELECT LTRIM('      A            ') || 'B' FROM DUAL;

SELECT 
LTRIM('      A            ') || 'B',
RTRIM('          C         ') || 'D' FROM DUAL;

SELECT 
	ROUND(10.567) 반올림,
	CEIL(10.2) 올림,
	FLOOR(10.567) 버림,
	TRUNC(10.5678,2) 절사,
	MOD(10, 3) 나머지
FROM DUAL;
	
SELECT TO_NUMBER('1,000', '9,999')+ 1000 FROM DUAL;

SELECT ADD_MONTHS(TO_DATE('10-02-2024','MM-DD,YYYY'), 3) FROM DUAL; 

SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY/MM/DD') HIREDATE FROM EMP; 

SELECT 
EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY/MM/DD') HIREDATE,
TO_CHAR(SAL, '9,999.99') SAL
FROM EMP; 


SELECT 
TO_DATE('80/02/17', 'YY/MM/DD') YY,
TO_DATE('80/02/17', 'RR/MM/DD') RR
FROM DUAL;


SELECT EMPNO, ENAME, COMM, NVL2(COMM, 'O','X') "수당여부" FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
	DECODE(JOB,
				'MANAGER', SAL * 1.1,
				'SALESMAN', SAL * 1.05,
				'ANALYST', SAL, 
				SAL * 1.03) "인상급여"
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL, 
	CASE JOB
		WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL 
		ELSE SAL * 1.03
		END "인상 급여"
FROM EMP;

SELECT EMPNO, ENAME, SAL, 
	CASE 
		WHEN SAL <= 1500 THEN 'LOW'
		WHEN SAL <= 2000 THEN 'MID'
		ELSE 'HIGH'
	END "급여 수준"
FROM EMP;

-- 다중행 함수와 데이터 그룹화

SELECT 
	SUM(SAL) 합계,
	ROUND(AVG(SAL)) 평균,
	MAX(SAL) 최대,
	MIN(SAL) 최소
FROM EMP;

SELECT COUNT(COMM) "수당을 받는 직원 수", 
COUNT(*) "전체 직원수" FROM EMP; -- NULL은 연산에서 제외
 
SELECT 
	DEPTNO,
	JOB,
	SUM(SAL) 합계,
	ROUND(AVG(SAL)) 평균,
	MAX(SAL) 최대,
	MIN(SAL) 최소
FROM EMP GROUP BY DEPTNO, JOB; -- DEPTNO(부서번호)의 같은 값을 가지고 그룹화	
	
-- 부서 + 직책별 급여 평균 2000불 이상인 통계 AVG
SELECT 
	DEPTNO,
	JOB,
	SUM(SAL) 합계,
	ROUND(AVG(SAL)) 평균,
	MAX(SAL) 최대,
	MIN(SAL) 최소
FROM EMP 
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000;
		
	
	
	
	
	
	
	
	
	
	
	
	
	



