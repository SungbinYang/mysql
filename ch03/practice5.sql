DROP TABLE myTable;

-- 인덱스 테이블 만들기
CREATE TABLE indexTBL (
	first_name varchar(14), 
    last_name varchar(16), 
    hire_date date
);

-- 더미 데이터 만들기
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
    LIMIT 500;

-- 더미 데이터 조회
SELECT * FROM indexTBL;

-- 특정 더미 데이터 조회
SELECT * FROM indexTBL WHERE first_name = 'Mary';

-- 인덱스 생성
CREATE INDEX idx_indexTBL_firstname on indexTBL(first_name);