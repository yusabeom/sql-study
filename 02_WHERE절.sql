
SELECT * FROM employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'it_prog';

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = '50'; -- 암묵적 형 변환

-- 범위 지정
SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000;

-- 날짜 지정은 문자형태로
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- 데이터의 행 제한(BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용(특정 값들과 비교할 때 사용)
SELECT * FROM employees
WHERE manager_id IN (100,101,102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE 연산자 (지정 문자열 포함 여부)
-- %기호는 anything
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

--앞자리 공백을 언더바로 채우면 자릿수 이후 문자를 찾아줌
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; 

-- NULL비교는 IS, IS NOT으로 비교
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees -- 괄호를 삽입하여 연산순서 조정(AND가OR보다 연산순서가 빠름
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
AND salary >= 6000
OR job_id = 'FI_MGR';

-- 데이터의 정렬 ORDER BY (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: ascending 오름차순 -> 생략이 가능합니다.
-- DESC: descending 내림차순
SELECT * FROM employees
ORDER BY hire_date;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name DESC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SElECT
    first_name,
    salary*12 AS pay
FROM employees    
ORDER BY pay DESC;












