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