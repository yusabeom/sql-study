/*
프로시저명 divisor_proc
숫자 하나를 전달받아 해당 값의 약수의 개수를 출력하는 프로시저를 선언합니다.
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
    dbms_output.put_line(n ||'의 약수의 개수: '|| c);
END;

EXEC divisor_proc(10);

/*
부서번호, 부서명, 작업 flag(I: insert, U:update, D:delete)을 매개변수로 받아 
depts 테이블에 
각각 INSERT, UPDATE, DELETE 하는 depts_proc 란 이름의 프로시저를 만들어보자.
그리고 정상종료라면 commit, 예외라면 롤백 처리하도록 처리하세요.
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
employee_id를 전달받아 employees에 존재하면,
근속년수를 out하는 프로시저를 작성하세요. (익명블록에서 프로시저를 실행)
없다면 exception처리하세요
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
        dbms_output.put_line('해당 아이디는 없습니다.');
       p_year := 0;
END;








































































