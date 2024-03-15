
-- ������ (���������� �����ϴ� ���� ����� �ִ� ��ü)

CREATE SEQUENCE dept2_seq 
    START WITH 1 --���۰� (�⺻���� ������ �� �ּҰ�, ������ �� �ִ밪)
    INCREMENT BY 1 -- ������ (����� ����, ������ ����, �⺻�� 1) 
    MAXVALUE 10 -- �ִ밪 (�⺻���� ������ �� 1027, ������ �� -1)
    MINVALUE 1 -- �ּҰ� (�⺻���� ������ �� 1 ������ �� -1028)
    NOCACHE -- ĳ�� �޸� ��� ���� (CACHE)
    NOCYCLE; -- ��ȯ ���� (NOCYCLE�� �⺻, ��ȯ��Ű���� CYCLE)

------------------------------------------------------------------
DROP TABLE dept2;
CREATE TABLE dept2 (
    dept_no NUMBER(2) PRIMARY KEY,
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

-- ������ ����ϱ� (NEXTVAL, CURRVAL)
SELECT dept2_seq.CURRVAL FROM dual; -- ���� ������ ��

INSERT INTO dept2
VALUES(dept2_seq.NEXTVAL, 'test','test',sysdate); -- INSERT ���� �� ������ �������� Ȱ��.

SELECT * FROM dept2;

-- ������ �Ӽ� ���� (���� ������ ����)
-- START WITH�� ������ �Ұ����մϴ�.
ALTER SEQUENCE dept2_seq MAXVALUE 9999; -- �ִ밪 ����
ALTER SEQUENCE dept2_seq INCREMENT BY 10; -- ������ ����

-- ������ ���� �ٽ� ó������ ������ ���.

DROP SEQUENCE dept2_seq;

--------------------------------------------------------------------------
/*
- index
index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�,
��ȸ�� ������ �� �ִ� hint ������ �մϴ�.
index�� ��ȸ�� ������ ������, �������ϰ� ���� �ε����� �����ؼ�
����ϸ� ������ ���� ���ϸ� ����ų �� �ֽ��ϴ�.
���� �ʿ��� ���� index�� ����ϴ� ���� �ٶ����մϴ�.
*/
SELECT * FROM employees
WHERE employee_id = 158;

-- �ε��� ����

CREATE INDEX emp_salary_idx ON employees(salary);
/*
���̺� ��ȸ �� �ε����� ���� �÷��� �������� ����Ѵٸ�
���̺� ��ü ��ȸ�� �ƴ�, �÷��� ���� �ε����� �̿��ؼ� ��ȸ�� �����մϴ�.
�ε����� �����ϰ� �Ǹ� ������ �÷��� ROWID�� ���� �ε����� �غ�ǰ�, 
��ȸ�� ������ �� �ش� �ε����� ROWID�� ���� ���� ��ĵ�� �����ϰ� �մϴ�.
*/
DROP INDEX emp_salary_idx;
/*
- �ε����� ����Ǵ� ��� 
1. �÷��� WHERE �Ǵ� �������ǿ��� ���� ���Ǵ� ���
2. ���� �������� ���� �����ϴ� ���
3. ���̺��� ������ ���
4. Ÿ�� �÷��� ���� ���� null���� �����ϴ� ���.
5. ���̺��� ���� �����ǰ�, �̹� �ϳ� �̻��� �ε����� ������ �ִ� ��쿡��
 �������� �ʽ��ϴ�.
*/































































































