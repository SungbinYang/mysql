-- 새로운 데이터 추가
INSERT INTO memberTBL VALUES('Figure', '연아', '경기도 군포시 당정동');

-- 데이터 조회
SELECT * FROM memberTBL;

-- 데이터 변경
UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';

-- 데이터 삭제
DELETE FROM memberTBL WHERE memberName = '연아';

-- 멤버 탈퇴 테이블 작성
CREATE TABLE deletedMemberTBL (
	memberID char(8),
    memberName char(5),
    memberAddress char(20),
    deletedDate date -- 삭제한 날짜
);

-- 트리거 생성
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL -- 트리거 이름
	AFTER DELETE -- 삭제 후에 작동하게 지정
    ON MEMBERTBL -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용
BEGIN
	-- OLD 테이블의 내용을 백업테이블에 삽입
    INSERT INTO deletedMemberTBL VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
END //
DELIMITER ;