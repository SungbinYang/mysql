-- member table data 조회
SELECT * FROM memberTBL;

-- 특정 컬럼 조회
SELECT memberName, memberAddress FROM memberTBL;

-- 특정 데이터 조회
SELECT memberName, memberAddress FROM memberTBL WHERE memberName='상길이';

-- 테이블 생성
CREATE TABLE myTable (id int);