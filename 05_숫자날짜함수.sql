--�����Լ�
--ROUND(�ݿø�)
--���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����.
SELECT
    ROUND(3.1415,3), ROUND(45.923,0), ROUND(44.923,-1)
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶���ϴ�.
SELECT
    TRUNC(3.1415,3), TRUNC(45.923,0), TRUNC(44.923,-1)
FROM dual;

-- ABS (���밪)
SELECT ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(������ ������ ����)
SELECT
    10 / 4, MOD(10,4)
FROM dual;

----------------------------------------------------------------

-- ��¥�Լ�
--sysdate: ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð���������
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual; -- ->�и���, ǥ�ؽñ��� ����

-- ��¥�� ������ �����մϴ�.
SELECT sysdate + 1 FROM dual;

-- ��¥Ÿ�԰� ��¥Ÿ���� ���� ������ �����մϴ�.
-- ������ ������� �ʽ��ϴ�.
SELECT
    first_name, TRUNC(sysdate - hire_date,0)
FROM employees; -- ����

SELECT
    first_name,
    (sysdate - hire_date) / 7 AS week
FROM employees; -- �ּ�

SELECT
    first_name,
    (sysdate - hire_date) / 365 AS year
FROM employees;

-- ��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate,'year') FROM dual; -- �� �������� �ݿø�
SELECT ROUND(sysdate,'month') FROM dual; -- �� �������� �ݿø�
SELECT ROUND(sysdate,'day') FROM dual; -- �� �����Ƿ� �ݿø�

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate,'year') FROM dual; -- �� �������� ����
SELECT TRUNC(sysdate,'month') FROM dual; -- �� �������� ����
SELECT TRUNC(sysdate,'day') FROM dual; -- �� �������� ����
















