
-- WHILE��

DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; --begin
BEGIN
    WHILE v_count <= 10 --end
    LOOP
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP;
    dbms_output.put_line(v_total);
END;

-- Ż�⹮
DECLARE
    v_total NUMBER := 0;
    v_count NUMBER := 1; --begin
BEGIN
    WHILE v_count <= 10 --end
    LOOP
        EXIT WHEN v_count = 5; --break
        
        v_total := v_total + v_count;
        v_count := v_count + 1; -- step
    END LOOP;
    dbms_output.put_line(v_total);
END;

-- FOR��
DECLARE
    v_num NUMBER := 7;
BEGIN
    
    FOR i IN 1..9 -- ..�� �ۼ��ؼ� ������ ǥ��
    LOOP
        dbms_output.put_line(v_num || ' x ' || i || ' = ' || v_num*i);
    END LOOP;
    
END;

-- CONTINUE��
DECLARE
    v_num NUMBER := 7;
BEGIN
    
    FOR i IN 1..9 -- ..�� �ۼ��ؼ� ������ ǥ��
    LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line(v_num || ' x ' || i || ' = ' || v_num*i);
    END LOOP;
    
END;

-------------------------------------------------------------------------------
-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
DECLARE
    n NUMBER := 2;
BEGIN
    WHILE n <= 9
    LOOP
        FOR i IN 1..9
        LOOP
        dbms_output.put_line(n || ' x ' || i || ' = ' || n*i);
        END LOOP;
        n := n + 1;
    END LOOP;
END;
-- ¦���ܸ� ����� �ּ���. (2, 4, 6, 8)
DECLARE
    n NUMBER := 2;
BEGIN
    WHILE n <= 9
    LOOP
        CONTINUE WHEN MOD(n,2) = 1 ;
        FOR i IN 1..9
        LOOP
        dbms_output.put_line(n || ' x ' || i || ' = ' || n*i);
        END LOOP;
        n := n + 1;
    END LOOP;
END;
-- ����� ����Ŭ ������ �߿��� �������� �˾Ƴ��� �����ڰ� �����. (% ����~)


-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3 ....

CREATE TABLE board (
    bno NUMBER(5)CONSTRAINT board_bno_pk PRIMARY KEY,
    writer VARCHAR(20),
    title VARCHAR(20)
);
DESC board;
DROP TABLE board;
CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- ���� 2    
DECLARE
    c NUMBER := 1;
BEGIN
    WHILE c <= 300
    LOOP
        INSERT INTO board
        VALUES(board_seq.nextval,'test'||c,'title'||c);
        c := c + 1;
    END LOOP;
    
END;
COMMIT;
SELECT * FROM board;
DROP SEQUENCE board_seq;
SELECT board_seq.CURRVAL FROM dual;








































































