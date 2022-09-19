> [이것이 mysql이다.](http://www.yes24.com/Product/Goods/90118480)책을 참고하여 작성하였습니다.

## 요구사항 분석과 시스템설계 그리고 모델링

### 정보시스템 구축 절차 요약
우리가 어느 시스템을 만들기 위해서 요구사항을 분석하고 분석 후, 시스템을 설계 및 모델링을 하는 작업을 들어간다. 쉽게 이야기해서 건물을 지을 때 건물을 사용할 사용자에게 인터뷰를 하고 사용자 요구사항에 맞게 설계도를 그리고 구축하는것과 유사하다.

### 데이터베이스 모델링과 필수용어
데이터베이스 모델링이란, 저장하고자 할 현실세계를 mysql에 속성값을 뽑아 어떻게 옮길지 설계하는 과정이다.

위의 그림을 통해 DB 용어를 알아보자.

- 데이터: 당탕이, 01/22, 22과 같이 하나하나의 단편적인 정보를 뜻한다. 이런 데이터들이 여러 모여있는게 즉, 현실세계이다.
- 테이블: 한건한건 데이터를 저장하고 싶을 때, 예쁘게 만들어서 저장하고 싶을 때, 사용하는게 테이블이다. 즉, 데이터를 예쁘게 표현하기 위한 수단이다.
	* 테이블은 2차원 구조로 이루어져 있다.
    * 테이블은 세로가 열(column), 가로가 횡(row)이다.
- 데이터베이스: 이런 테이블들이 모여있는 저장소가 데이터베이스이다.
- DBMS: 이런 데이터베이스들이 모여있는게 DBMS이다.
- 열(=컬럼=필드): 열의 개수는 데이터 개수라고 보장이 안되며, 열은 각각 이름이 붙여지고 데이터 형식을 지정해야 한다.
- 열 이름: 각 열을 구분하기 위한 이름이다. 열 이름은 각 테이블 내에서는 중복되지 않고, 고유해야 한다.
- 데이터 형식: 열의 데이터 형식을 말한다. 예를 들어, 문자열, 날짜형식, 숫자등을 볼 수 있다.
- 행(=로우=레코드): 행의 개수는 데이터의 개수로 보장된다.
- 기본키(primary key): 각 행을 구분하는 유일한 열이다. 예를들어, 쇼핑몰의 아이디와 같다. 즉, 중복되지 않고, 비어있으면 안되며 반드시 존재해야한다.
- SQL: 사람의 말로 DBMS가 못알아들으므로 DBMS가 알아들을 수 있게 소통하는 언어를 SQL이라고 한다.

## MySQL을 이용한 데이터베이스 구축 절차

### 데이터베이스 생성

워크벤치나 Datagrip을 켜고 쇼핑몰 데이터 베이스를 생성해보자.

```
CREATE SCHEMA `shopdb`;
```

위의 쿼리를 터미널에서 명령하거나 워크벤치에서 스키마 공란에 오른쪽 마우스를 눌러 create schema를 눌러서 지정해주면 아래 그림처럼 적용하면 생성이 된다.

### 테이블 생성

테이블을 생성함에 있어서 테이블 설계도가 필요하다. 설계도에 따라 테이블을 만들면 되는데 sql로는 아래와 같다.

```
CREATE TABLE `shopdb`.`memberTBL` (
  `memberID` CHAR(8) NOT NULL,
  `memberName` CHAR(5) NOT NULL,
  `memberAddress` CHAR(20) NULL,
  PRIMARY KEY (`memberID`));

 CREATE TABLE `shopdb`.`productTBL` (
  `productName` CHAR(4) NOT NULL,
  `cost` INT NOT NULL,
  `makeDate` DATE NULL,
  `company` CHAR(5) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`productName`));
```

워크벤치로는 방금만든 스키마 오른쪽 마우스를 눌러서 create table을 눌러서 아래 그림처럼 값을 넣어주면 된다.

### 데이터 입력

이제 데이터를 입력해보자. sql로는 아래와 같다.

```
-- member table data insert
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('Dang', '당탕이', '경기 부천시 중동');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('Jee', '지운이', '서울 은평구 증산동');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('Han', '한주연', '인천 남구 주안동');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('Sang', '상길이', '경기 성남시 분당구');

-- product table data insert
INSERT INTO `shopdb`.`productTBL` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('컴퓨터', '10', '2021-01-01', '삼성', '17');
INSERT INTO `shopdb`.`productTBL` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('세탁기', '20', '2022-09-01', 'LG', '3');
INSERT INTO `shopdb`.`productTBL` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('냉장고', '5', '2023-02-01', '대우', '22');
```

워크벤치로는 아래와 같다.

### 데이터 활용

이제 데이터를 활용해보자. 먼저 우리가 만든 shopdb를 더블클릭하자. 그러면 shopdb로 접속이 된다. sql로는 아래와 같다.

```
use shopdb;
```

이제 모든 회원 테이블을 조회해보자.

```
SELECT * FROM memberTBL;
```

처음으로 나온 sql문은 SELECT문인데 기본형태가 SELECT 열 이름 FROM 테이블 이름 \[WHERE 조건\] 형식을 갖는다. 열 이름에 \* 를 쓰면 모든 열을 뜻한다. 이제 select문으로 특정 컬럼 조회, 특정 데이터 조회도 가능하다.

```
-- 특정 컬럼 조회
SELECT memberName, memberAddress FROM memberTBL;

-- 특정 데이터 조회
SELECT memberName, memberAddress FROM memberTBL WHERE memberName='상길이';
```

## 테이블 외의 데이터베이스 개체의 활용
테이블 외에 다른 중요한 데이터베이스 개체로는 인덱스, 스토어드 프로시저, 트리거, 커서등이 있다.

### 인덱스
없어도 문제가 없지만 있으면 효율적이다. 예시를 들자면 책의 찾아보기 기능과 같다. 즉, 찾아보기를 통해 검색하고자 하는걸 굉장히 빠르게 찾을 수 있으며, 주고 sql문의 select문과 많이 사용된다. 그럼 실습을 통해 인덱스 생성 및 장점을 살펴보자.

먼저 인덱스를 테스트할 테이블을 하나 만든다.

``` sql
-- 인덱스 테이블 만들기
CREATE TABLE indexTBL (
	first_name varchar(14), 
    last_name varchar(16), 
    hire_date date
);
```

다음으로 더미데이터를 방금 만든 테이블이 넣는다. 더미 데이터는 이전에 설치한 샘플 데이터베이스를 가져온다.

``` sql
-- 더미 데이터 만들기
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
    LIMIT 500;
```

그럼 이때 특정 더미데이터를 한번 조회해본다.

``` sql
-- 특정 더미 데이터 조회
SELECT * FROM indexTBL WHERE first_name = 'Mary';
```

이때 검색하는데 시간과 방법은 아래처럼 full scan을 한 방법이다. 즉, 책으로 치면 처음부터 끝까지 스캔해서 찾은 방법이다.

하지만 인덱스를 사용해서 하면 어떨까? 한번 인덱스를 생성해보자.

``` sql
-- 인덱스 생성
CREATE INDEX idx_indexTBL_firstname on indexTBL(first_name);
```

그 후에, 다시한번 select 쿼리를 날려보자. 그럼 아래처럼 non-unique key lookup 방식을 쓴다.

이처럼 인덱스는 실무에서 진짜 많이 사용하는 방식이다.

​
## 데이터베이스 개체 - 뷰, 저장 프로시저, 트리거
### 뷰
뷰란 일종의 가상의 테이블이다. 그말은 즉, 테이블처럼 보이지만 테이블은 아닌 경우를 말한다. 쉽게 말하면 일종의 테이블 바로가기 아이콘으로 테이블에 링크된 개념으로 보면 된다. 그러면 뷰는 어디서 쓸까?
​
예를 들어, 어느 인턴분이 DB 데이터 최신화 작업을 하고 있다고 가정하자. 그 인턴분에게는 사용자의 중요 개인정보를 열람하게 되는데 그러다가 실수로 데이터를 날리거나 잘못 변경되면 운영에 큰 문제가 발생할 것이다. 그래서 이런 경우를 대비해 뷰를 통하여 인턴분에게 보여줄 가짜 테이블을 보여주는 것이다. 이 가짜 테이블은 진짜 데이터는 아니고 옆의 진짜 테이블의 데이터와 연결된 것이라 봐도 무방하다. 그럼 실습을 통해 알아보자.
​
뷰 생성 쿼리는 다음과 같다.
​
``` sql
-- view 생성
CREATE VIEW uv_memberTBL
AS
    SELECT memberID, memberAddress FROM memberTBL;
```
​
``` sql
-- 뷰 데이터 조회
SELECT * FROM uv_memberTBL;
```
​
### 스토어드 프로시저
MySQL에서 제공해주는 프로그래밍 기능으로 다른 프로그래밍 언어와 같은 기능을 담당한다. 그럼 실습을 통해 확인해보자.
​
두개의 데이터를 조회하는 쿼리이다.
​
``` sql
-- 데이터 조회 (프로시저 전)
SELECT * FROM memberTBL WHERE memberName = '당탕이';
SELECT * FROM productTBL WHERE productName = '냉장고';
```
​
이 쿼리를 묶어서 프로시저로 만들려면 아래와 같이 하면 된다.
​
``` sql
-- 프로시저 생성
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
    SELECT * FROM memberTBL WHERE memberName = '당탕이';
    SELECT * FROM productTBL WHERE productName = '냉장고';
END //
DELIMITER ;
```
​
후에 프로시저를 호출해주면 된다.
​
``` sql
CALL myProc();
```
​
### 트리거
트리거란 테이블에 부착되어서 테이블에 INSET나 UPDATE 또는 DELETE 작업이 발생되면 실행되는 코드를 말한다. 그러면 트리거는 어디서 사용할까?
​
예를 들어 회원 테이블이 있는데 그 중 한 회원이 탈퇴를 하였다. 그 후에, 회사에 와서 자기 탈퇴전 이력을 달라고 요청할 때, 그럴 때 사용이 가능하다.
​
실습을 해보자. 먼저 탈퇴회원 테이블을 만든다.
​
``` sql
-- 멤버 탈퇴 테이블 작성
CREATE TABLE deletedMemberTBL (
    memberID char(8),
    memberName char(5),
    memberAddress char(20),
    deletedDate date -- 삭제한 날짜
);
```
​
그 후에 트리거를 부착한다.
​
``` sql
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
```
​
후에, 트리거 부착한 테이블에 DELETE 쿼리를 날리면 자동으로 탈퇴회원테이블에 INSERT가 될 것이다.

## 백업과 복원
백업은 현재 데이터베이스를 다른 매체로 보관하는 작업을 말하며, 복원은 데이터베이스에 문제가 발생하였을 때, 다른 매체에 백업된 데이터를 이용해서 원상태로 돌녀놓는 작업을 말한다.

DBA에 있어서 백업과 복원은 정말 중요한 작업이니 잘 공부해보자.

먼저 DB 백업방법은 아래와 같다. 아래의 그림처럼 Administration 탭으로 들어가 해당 스키마와 테이블을 선택해서 백업해주면 된다.

정상적으로 완료되면 다음 화면이 나온다.

다음으로 복원을 해보자. 복원도 백업처럼 백업파일 설정해주고 스키마 설정해주고 복원해준다.

정상적으로 완료되면 아래와 같이 나온다.