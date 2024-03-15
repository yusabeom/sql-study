
/*
view�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����Դϴ�.
��� �⺻ ���̺�� ������ ���� ���̺��̱� ������
�ʿ��� �÷��� ������ �θ� ������ ������ ���ϴ�.
��� �������̺�� ���� �����Ͱ� ���������� ����� ���´� �ƴմϴ�.
�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ֽ��ϴ�.
*/
SELECT * FROM user_sys_privs; -- ���� Ȯ��

-- �ܼ� ��: �ϳ��� ���̺��� �̿��Ͽ� ������ ��
-- ���� �÷����� �Լ� ȣ�⹮, ����� �� ���� ���� ǥ�����̸� �ȵ˴ϴ�.
SELECT
    employee_id,
    first_name || '' || last_name,
    job_id,
    salary
FROM employees
WHERE department_id = 60;

CREATE VIEW view_emp AS (
    SELECT
        employee_id,
        first_name || '' || last_name AS full_name, 
        salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp
WHERE salary >= 6000;

-- ���� ��
-- ���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ���.
CREATE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        first_name || '' || last_name AS full_name,
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id;

SELECT * FROM view_emp_dept_job;

-- ���� ���� (CREATE OR REPLACE VIEW ����)
-- ���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� �����˴ϴ�.

CREATE OR REPLACE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        first_name || '' || last_name AS full_name,
        d.department_name,
        j.job_title,
        e.salary
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id;

SELECT
    job_title,
    AVG(salary) AS avg
FROM view_emp_dept_job
GROUP BY job_title
ORDER BY avg DESC; -- SQL ������ ��������.

-- �� ����
DROP VIEW view_emp;

/*
VIEW�� INSERT�� �Ͼ�� ��� ���� ���̺��� �ݿ��� �˴ϴ�.
�׷��� VIEW�� INSERT, UPDATE, DELETE�� ���� ���� ������ �����ϴ�.
���� ���̺��� NOT NULL�� ��� VIEW�� INSERT�� �Ұ����մϴ�.
VIEW���� ����ϴ� �÷��� ������ ��쿡�� �ȵ˴ϴ�.
*/
INSERT INTO view_emp_dept_job
VALUES(300,'test','test','test',10000); -- �ȵ�.

-- join�� ���� ��쿡�� �� ���� ������ �� �����ϴ�.
INSERT INTO view_emp_dept_job
    (employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 10000);    

-- ���� ���̺� �÷� �� NOT NULL �÷��� �����ϰ�, �ش� �÷��� view�� ������ �� ���ٸ� INSERT�� �Ұ��մϴ�.
INSERT INTO view_emp_dept_job
    (employee_id, job_id, salary)
VALUES(300, 'test', 10000);

DELETE FROM view_emp
WHERE imployee_id = 107;

ROLLBACK;

-- WITH CHECK OPTION -> ���� ���� �÷�
-- �並 ������ �� ����� ���� �÷��� �並 ���ؼ� ������ �� ���� ���ִ� Ű����
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck;

SELECT * FROM view_emp_test;

UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 107;

-- �б� ���� �� -> WITH READ ONLY (DML ������ ���� -> SELECT�� ���)












































































































