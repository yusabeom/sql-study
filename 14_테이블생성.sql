
/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ� -> ex) 265.43
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/
-- ���̺� �����(�÷��� Ÿ���ֱ�)
CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);
DESC dept2;
SELECT * FROM dept2;

-- NUMBER�� VARVHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES(10,'������','����',sysdate,1000000);
INSERT INTO dept2
VALUES(20,'���ߺ�','����',sysdate,2000000);
INSERT INTO dept2
VALUES(30,'�濵����','���',sysdate,2000000000);

-- �÷� �߰�
ALTER TABLE dept2
ADD dept_count NUMBER(3);

-- �÷��� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

SELECT * FROM dept2;

-- �÷� �Ӽ� ����
-- ���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ�, �׿� �´� Ÿ������ �����ؾ���.
-- �����ʴ� Ÿ������ ���� �Ұ���.
-- Ŀ�԰� �ѹ��� ȿ���� ����!(DDL�� �ڵ����� Ŀ���̵�)
-- �ٽ� �ǵ��� ���� ������ �����ϰ� ���̺� ���� �� �����ϱ�!
ALTER TABLE dept2
MODIFY dept_name VARCHAR2(50); -- �Ӽ�! ���̸� ��� ����

-- DDL(CREATE, ALTER, TRUNCATE, DROP)�� Ʈ������� ����� �ƴմϴ�.
ROLLBACK;

-- �÷� ����
-- �÷��� �����Ͱ� �����ص� �����ȴ�.
ALTER TABLE dept2
DROP COLUMN dept_bonus;

SELECT * FROM dept3;

-- ���̺� �̸�����
ALTER TABLE dept2
RENAME TO dept3;


-- ���̺� ���ε����� ���� (������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

-- ���̺� ��ü ����
DROP TABLE dept3;
































































