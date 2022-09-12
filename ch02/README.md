> [이것이 mysql이다.](http://www.yes24.com/Product/Goods/90118480)책을 참고하여 작성하였습니다.

## MySQL 설치

### 소프트웨어 요구사항

거의 요즘 왠만한 PC는 다 설치가 가능하며, 우리가 설치할 버전은 mysql8.0.X버전이다. 나는 현재 OS가 mac이므로 mac 설치사항만 표기하겠다.

### MySQL 설치

먼저, mysql 다운로드 홈페이지로 간다.

[mysql 홈페이지](https://dev.mysql.com/downloads/mysql/)

다음으로 해당 OS에 맞는 installer를 다운로드 받아준다.

다운 후, 설치를 해주고, 마지막 비밀번호를 작성하는 칸이 있다. 자신이 기억할만한 비밀번호를 작성한다.

그 후에 시스템 환경설정으로 들어가서 mysql 아이콘이 있으면 정상작동 된것이다.

### MySQL 터미널 설치
이제 우리는 터미널에서 mysql을 사용할 수 있도록 설치를 해주어야 한다. 나는 homebrew를 통하여 설치하였다.

``` bash
> brew update
```

``` bash
> brew install mysql
```

### MySQL Workbench 설치
워크벤치란, 우리가 sql을 작성할 때, 터미널보단 ui적으로 편리하게 작성이 가능하도록한 툴이다.

``` bash
> brew install --cask mysqlWorkbench
```

위의 명령어로 설치하면 아래와 같이 나온다.

여기서 localhost를 접속해보자. 그러면 비밀번호를 입력하는 것이 나오는데 처음 설정한 비밀번호를 입력하면 된다.

접속 후, 한 가지 설정값이 있는데, Preference > SQL Editor를 클릭 후 하단 체크박스를 해제한다.

### MySQL Datagrip 이용
워크벤치 이외에도 편리하게 하는 에디터중 Datagrip이 있다. Datagrip은 jetbrains사에서 만들었고 아래의 경로로 다운이 가능하다. (유료)

[Datagrip](https://www.jetbrains.com/ko-kr/datagrip/)

datagrip은 다양한 DBMS 연동도 가능하다.

마지막으로 필자는 Workbench와 Datagrip을 번갈아 이용해볼 예정이다.

### sample data 설치
우리가 실습할 데이터를 미리 설치할 예정이다.

[샘플 데이터](https://cafe.naver.com/thisismysql)

위의 링크에서 교재 자료실 > 샘플 데이터를 찾아서 압축을 푼다.

압축을 푼 후에 터미널로 그 경로에 접속 후, 거기서 mysql을 접속한다. 접속 후, 아래와 같은 명령어를 작성한다.

``` sql
> source employees.sql;
```

설치가 다 되었으면 아래의 쿼리를 작성후, employees 데이터베이스가 만들어졌는지 확인해보자.

``` sql
> show databases;
```