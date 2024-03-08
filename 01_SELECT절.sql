
-- ����Ŭ�� �� �� �ּ��Դϴ�.

/*
������ �ּ��Դϴ�.
����
*/

-- SELECT [�÷���(���� �� ����)] FROM [���̺� �̸�]
SELECT 
    *
FROM 
    employees;
-- select * from employees; �̷��Ե� ������

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;
    
SELECT email, phone_number, hire_date
FROM employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� [ * / + - ] ������ �����մϴ�.

SELECT
    employee_id,
    first_name,
    last_name,
    salary + salary*0.1 AS ������
FROM employees;    

-- NULL ���� Ȯ�� (���� 0�̳� ������� �ٸ� �����Դϴ�.)
SELECT department_id, commission_pct
FROM employees;

-- alias (�÷���, ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
SELECT
    first_name AS �̸�,
    last_name AS ��,
    salary*300 AS ����޿�
FROM employees;

/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ������, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�.
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/
SELECT
    first_name || ' ' || last_name || '''s salary is $' || salary AS full_name
FROM employees;

-- DISTINCT (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID
-- (�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ��ȯ)
-- (�ο���̵�: �����ͺ��̽� ���� ���� �ּҸ� ��ȯ)
SELECT ROWNUM, ROWID, employee_id
FROM employees;




