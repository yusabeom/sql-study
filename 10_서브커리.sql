
/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/

-- �̸��� 'Nancy'�� ������� �޿��� ���� ����� ���ϱ�
SELECT salary FROM employees
WHERE first_name = 'Nancy';

SELECT first_name fROM employees
WHERE salary > 12008;

-- ���������� Ȱ���� ����.
SELECT first_name fROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE first_name = 'Nancy');

-- employee_id�� 103���� ����� job_id�� ������ job_id�� ���� ����� ��ȸ.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id = 103);

-- ���� ������ ���������� �����ϴ� ���� ���� ���� 
-- ������ ������(�ַ� �� ������=<>)�� ����� �� ����,
-- �ϳ��� �ุ ��ȯ�ؾ� �մϴ�.
-- �̷� ��� ���� �� �����ڸ� ����ؾ� �մϴ�.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King');
                
-- ���� �� ������ (IN, ANY, ALL, EXISTS)

-- IN: ��ȸ�� ����� � ���� �������� ���մϴ�.
SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');
                
-- first_name�� David�� ������� �޿��� ���� �޿��� �޴� ������� ��ȸ.
SELECT * FROM employees
WHERE salary IN (SELECT salary FROM employees
                WHERE first_name = 'David');

-- ANY, SOME: ���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- �ϳ��� �����ϸ� ��ȸ ��� ���Ե˴ϴ�.
-- David��� �����, ���� ���� �޿��� �޴� David���� �޿��� ���� ����� ��ȸ.
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                    WHERE first_name = 'David');

-- ALL: ���� ���������� ���� ���ϵ� ������ ���� ��� ���ؼ�
-- ���� �� ��ġ�ؾ� ��ȸ��� ���Ե˴ϴ�.
-- David��� �����, ���� ���� �޿��� �޴� David���� �޿��� ���� ����� ��ȸ.

SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees
                    WHERE first_name = 'David');
                    
-- EXISTS: ���������� �ϳ� �̻��� ���� ��ȯ�ϸ� ������ ����.
-- job_history�� �����ϴ� ������ employees���� �����Ѵٸ� ��ȸ��� ����.
-- �������� ������ jh�� �ִ� id�� e�� �ִ� id�� ��ġ�� ������ 1�̶�� ���� ��ȸ.
-- EXISTS �����ڰ� 1�� ��ȸ�� �� �� �����Ͱ� �����Ѵٴ� ���� �Ǵ��Ͽ� employees���� �ش� ����� ��� ������ ��ȸ.
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
              WHERE e.employee_id = jh.employee_id);
              
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d
              WHERE department_id = 10);              

-- SELECT ���� ���������� ���̱�.
-- ��Į�� �������� ��� Ī�մϴ�.
-- ��Į�� ��������: ���� ����� ���� ���� ��ȯ�ϴ� ��������. �ַ� SELECT���̳�, WHERE ������ ����.
SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.first_name;

SELECT
    e.first_name,
    (
        SELECT
            department_name
        FROM departments d
        WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY e.first_name;

-- �� �μ��� �Ŵ��� �̸� ��ȸ
SELECT
    d.*,
    e.first_name AS manager_name
FROM departments d
LEFT JOIN employees e
ON d.manager_id = e.employee_id
ORDER BY d.manager_id;

SELECT
    d.*,
    (
        SELECT
            first_name
        FROM employees e
        WHERE e.employee_id = d.manager_id
    ) AS manager_name
FROM departments d
ORDER BY d.manager_id;

/*
- ��Į�� ���������� ���κ��� ���� ���
: �Լ�ó�� �� ���ڵ�� ��Ȯ�� �ϳ��� ������ ������ ��.

- ������ ��Į�� ������������ ���� ���
: ��ȸ�� �÷��̳� �����Ͱ� ��뷮�� ���, �ش� �����Ͱ�
����, ���� ���� ����� ��� (sql �������� ������ �� �� �پ�ϴ�.)
*/

-- �� �μ��� ��� �� �̱� (��Į��)
SELECT
    department_name,
    (
        SELECT
            COUNT(*)
        FROM employees e
        WHERE e.department_id = d.department_id
        
    ) AS �����
FROM departments d
ORDER BY d.department_id;

-----------------------------------------------------------
-- �ζ��� �� (FROM ������ ���������� ���� ��.)
-- Ư�� ���̺� ��ü�� �ƴ� SELECT�� ���� �Ϻ� �����͸� ��ȸ�� ���� ���� ���̺�� ����ϰ� ���� ��. 
-- ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ���.

-- salary�� ������ �����ϸ鼭 �ٷ� ROWNUM�� ���̸�
-- ROWNUM�� ������ ���� �ʴ� ��Ȳ�� �߻��մϴ�.
-- ����: ROWNUM�� ���� �ٰ� ������ ����Ǳ� ����. ORDER BY�� �׻� �������� ����.
-- �ذ�: ������ �̸� ����� �ڷῡ ROWNUM�� �ٿ��� �ٽ� ��ȸ�ϴ� ���� ���� �� ���ƿ�.
SELECT
    employee_id, first_name, salary, ROWNUM AS rn
FROM employees
ORDER BY salary DESC;

-- ROWNUM�� ���̰� ���� ������ �����ؼ� ��ȸ�Ϸ��� �ϴµ�,
-- ���� ������ �Ұ����ϰ�, ������ �� ���� ������ �߻��ϴ���.
-- ����: WHERE������ ���� �����ϰ� ���� ROWNUM�� SELECT �Ǳ� ������.
-- �ذ�: ROWNUM���� �ٿ� ���� �ٽ� �� �� �ڷḦ SELECT �ؼ� ������ �����ؾ� �ǰڱ���.
SELECT
    ROWNUM AS rn, tbl.*
    FROM
    (
    SELECT
        employee_id, first_name, salary
    FROM employees
    ORDER BY salary DESC
    ) tbl
WHERE rn >= 11 AND rn <= 20;

/*
���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� ����.
�ٱ��� SELECT ������ ROWNUM�� �ٿ��� �ٽ� ��ȸ
���� �ٱ��� SELECT �������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.

** SQL�� ���� ����
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
SELECT *
    FROM
    (
    SELECT
        ROWNUM AS rn, tbl.*
        FROM
        (
        SELECT
            employee_id, first_name, salary
        FROM employees
        ORDER BY salary DESC
        ) tbl
    )
WHERE rn >10 AND rn <= 20;    




































