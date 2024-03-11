
SELECT * FROM employees;

-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'it_prog';

SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = '50'; -- �Ϲ��� �� ��ȯ

-- ���� ����
SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000;

-- ��¥ ������ �������·�
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- �������� �� ����(BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN �������� ���(Ư�� ����� ���� �� ���)
SELECT * FROM employees
WHERE manager_id IN (100,101,102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE ������ (���� ���ڿ� ���� ����)
-- %��ȣ�� anything
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

--���ڸ� ������ ����ٷ� ä��� �ڸ��� ���� ���ڸ� ã����
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%'; 

-- NULL�񱳴� IS, IS NOT���� ��
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees -- ��ȣ�� �����Ͽ� ������� ����(AND��OR���� ��������� ����
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
AND salary >= 6000
OR job_id = 'FI_MGR';

-- �������� ���� ORDER BY (SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC: ascending �������� -> ������ �����մϴ�.
-- DESC: descending ��������
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












