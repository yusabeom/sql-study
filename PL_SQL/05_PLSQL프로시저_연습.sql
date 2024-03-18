/*
���ν����� divisor_proc
���� �ϳ��� ���޹޾� �ش� ���� ����� ������ ����ϴ� ���ν����� �����մϴ�.
*/
DROP PROCEDURE divisor_proc;
CREATE PROCEDURE divisor_proc
    (n IN NUMBER)
IS
    c NUMBER := 0;
BEGIN
    FOR i IN 1..n
    LOOP
        IF MOD(n,i) = 0 THEN
            c := c + 1;
        END IF;
    END LOOP;
    dbms_output.put_line(n ||'�� ����� ����: '|| c);
END;

EXEC divisor_proc(10);

/*
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/
CREATE OR REPLACE PROCEDURE depts_proc
    (
    de_no IN depts.department_id%TYPE,
    de_name IN depts.department_name%TYPE,
    flag IN VARCHAR2
    )
IS        
BEGIN
    IF flag = 'I' THEN
        INSERT INTO depts(department_id,department_name)VALUES(de_no,de_name);
    ELSIF flag = 'U' THEN
        UPDATE depts SET department_name = de_name WHERE department_id = de_no;
    ELSIF flag = 'D' THEN
        DELETE FROM depts WHERE department_id = de_no;
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;

/*
employee_id�� ���޹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/
CREATE OR REPLACE PROCEDURE emp_hire_proc
    (
    p_emp_id IN employees.employee_id%TYPE,
    p_year OUT NUMBER
    )
IS
  v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT 
        hire_date
    INTO 
        v_hire_date
    FROM employees
    WHERE employee_id = p_emp_id;

    p_year := TRUNC((sysdate - hire_date)/ 365);
    
    EXCEPTION 
    WHEN OTHERS THEN
        dbms_output.put_line('�ش� ���̵�� �����ϴ�.');
       p_year := 0;
END;








































































