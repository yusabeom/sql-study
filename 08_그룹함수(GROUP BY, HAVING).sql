
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT
-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; -- �� �� �������� ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; -- null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees;

-- �μ����� �׷�ȭ, �׷��Լ��� ���
SELECT
    department_id,
    TRUNC(AVG(salary),0)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- ������ ��
-- �׷� �Լ��� �ܵ������� ���� ���� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�. �׷��� �ʿ��մϴ�.
SELECT
    department_id,
    TRUNC(AVG(salary),0)
FROM employees
ORDER BY department_id; -- error

-- GROUP BY���� ����� �� GROUP���� ������ ���� �÷��� ��ȸ�� �� �����ϴ�.
SELECT
    job_id,
    department_id,
    TRUNC(AVG(salary),0)
FROM employees
GROUP BY department_id
ORDER BY department_id; -- ����

-- GROUP BY�� 2�� �̻� ���.
SELECT
    job_id,
    department_id,
    TRUNC(AVG(salary),0)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY�� ���� �׷�ȭ �� �� ������ �� ��� HAVING�� ���.
-- WHERE�� �Ϲ� ������. GROUP BY���� ���� ����˴ϴ�.
SELECT
    department_id,
    TRUNC(AVG(salary),0)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

-- 
SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 5000�̻� ��ȸ
SELECT --5
    department_id,
    TRUNC(AVG(salary),0) AS ���
FROM employees --1
WHERE department_id >= 50 --2
GROUP BY department_id --3
HAVING AVG(salary)>= 5000 --4
ORDER BY ��� DESC; --6


/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
SELECT
    job_id,
    COUNT(*),
    AVG(salary) AS ���
FROM employees
GROUP BY job_id
ORDER BY ��� DESC;
/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
SELECT
    TO_CHAR(hire_date,'YYYY')AS ��¥,
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
SELECT
    department_id,
    AVG(salary)
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;
    

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
SELECT
    department_id,
    TRUNC(AVG(salary+(salary*commission_pct)),2),
    SUM(salary),
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL 
GROUP BY department_id;


































