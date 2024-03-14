
-- ���� Ŀ�� Ȱ��ȭ ���� Ȯ��
SHOW AUTOCOMMIT;
-- ���� Ŀ�� ��
SET AUTOCOMMIT ON;
-- ���� Ŀ�� ����
SET AUTOCOMMIT OFF;

SELECT * FROM emps;

DELETE FROM emps WHERE employee_id = 100;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (304, 'lee', 'lee1234@gmail.com', sysdate, 'test');
    
-- �������� ��� ������ ��������� ���(���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����.
ROLLBACK;

-- ���̺� ����Ʈ ����
-- �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����.
SAVEPOINT insert_park;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (305, 'park', 'park1234@gmail.com', sysdate, 'test');
    
ROLLBACK TO SAVEPOINT insert_park;  

-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����.
-- �ٽ� Ŀ�� �������� ���ư� �� �����ϴ�.
COMMIT;
























































