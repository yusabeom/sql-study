-- lower(�ҹ���), initcap(�ձ��ڸ� �빮��),upper(�빮��)
/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/
SELECT * FROM dual; -- �������̺�

SELECT
    'abcDEF', lower('abcDEF'), initcap('abcDEF'), upper('abcDEF')
FROM dual; 

SELECT
    last_name,
    LOWER(last_name),
    INITCAP(last_name),
    UPPER(last_name)
FROM employees;

SELECT
    salary
FROM employees
WHERE LOWER(last_name) = 'austin';

-- length(����), instr(���� ã��, ������ 0�� ��ȯ, ������ �ε��� ��)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef','b')
FROM dual;

SELECT
    first_name,
    LENGTH(first_name),
    INSTR(first_name, 'a')
FROM employees;    

-- substr(�ڸ� ���ڿ�, �����ε���, ����)
-- substr(�ڸ� ���ڿ�, �����ε���) -> ���ڿ� ������.
-- �ε��� 1���� ����
-- concat(���� ����)
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef',2),
    CONCAT('abc','123')
FROM dual;

SELECT
    first_name,
    SUBSTR(first_name,1,3),
    CONCAT(first_name, last_name)
FROM employees;

-- LPAD, RPAD (��, ������ ������ ���ڿ��� ä���)
SELECT
    LPAD('abc',10,'*'),
    RPAD('abc',10,'*')
FROM dual;

-- LTRIM(), RTRIM(), TRIM()
-- TRIM() -> ���� ���� ����
-- LTRIM(param1, param2)-> param2�� ���� param1���� ã�Ƽ� ���� (���ʺ���)
-- RTRIM(param1, param2)-> param2�� ���� param1���� ã�Ƽ� ���� (�����ʺ���)
SELECT
    LTRIM('javascript_java','java')
FROM dual;

SELECT
    RTRIM('javascript_java','java')
FROM dual;

SELECT
    TRIM('          java            ')
FROM dual;

-- REPLACE(str, old, new)
SELECT
    REPLACE('my dream is a president',
    'president',
    'programmer')
FROM dual;

SELECT
 REPLACE(REPLACE('my dream is a president',
    'president',
    'programmer'), ' ','')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'), '!','?')
FROM dual;

----------------------------------------------------------------------------
/*
���� 1.
EMPLOYEES ���̺��� �̸�, �Ի����� �÷����� ����(��Ī)�ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. (CONCAT)
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�. (REPLACE)
*/
SELECT
    CONCAT(first_name,last_name) AS �̸�,
    REPLACE(hire_date,'/','') AS �Ի�����
FROM employees
ORDER BY �̸�;
    


/*
���� 2.
EMPLOYEES ���̺��� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���. (CONCAT, SUBSTR ���)
*/
SELECT
    CONCAT('02',SUBSTR( phone_number,4))
FROM employees;    


/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� ���ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
SELECT
    RPAD(SUBSTR(first_name,1,3),LENGTH(first_name),'*') AS first_name,
    LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';








