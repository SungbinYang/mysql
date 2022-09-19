-- view 생성
CREATE VIEW uv_memberTBL
AS
	SELECT memberID, memberAddress FROM memberTBL;


-- 뷰 데이터 조회
SELECT * FROM uv_memberTBL;