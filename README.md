# iot-database-2025
IoT 개발자 데이터베이스 저장소

## 1일차
- 데이터베이스 시스템
  - 통합된 데이터를 저장해서 운영하면서, 동시에 여러사람이 사용할 수 있도록 하는 시스템

  - 실시간 접근, 계속 변경, 동시 공유가 가능, 내용으로 참조(물리적으로 떨어져 있어도 사용가능)

  - DBMS - SQL Server, Oracle, MySQL, MariaDB, MongoDB...

- 데이터베이스 언어
  - SQL - Structured Query Language. 구조화된 질의 언어(프로그래밍언어와 동일)
    - DDL : DB나 테이블 생성, 수정, 삭제 언어
    - DML : 데이터 검색, 삽입, 수정, 삭제 언어
    - DCL : 권한 부여, 해제 제어 언어

- MySQL 설치(Docker)
    1. 파워쉘을 오픈, 도커 확인
        ```shell
        > docker -v
        Docker version 27.5.1, build 9f9e405
        ```
    2. MySQL Docker 이미지 다운로드
        ```shell
        > docker pull mysql
        Using default tag: latest
        latest: Pulling from library/mysql
        893b018337e2: Download complete
        43759093d4f6: Downloading [============================>                      ]  28.31MB/49.09MB
        cc9646b08259: Downloading [========>                                          ]  22.02MB/135.7MB
        df1ba1ac457a: Download complete
        277ab5f6ddde: Downloading [=========>                                         ]  9.437MB/48.42MB
        ...
        Status: Downloaded newer image for mysql:latest
        docker.io/library/mysql:latest
        ```
    3. MySQL Image 확인
        ```shell
        > docker images
        REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
        mysql        latest    146682692a3a   4 weeks ago   1.09GB
        ```
    4. Docker 컨테이너 생성
        - MySQL Port번호 3306이 기본
        - Oracle Port 1521
        - SQL Server 1433
        ```shell
        > docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=12345 -d -p 3306:3306 mysql:latest
        ```
    5. 컨테이너 확인
        ```shell
        > docker ps -a
        CONTAINER ID   IMAGE          COMMAND                   CREATED          STATUS          PORTS
     NAMES
        6a8b5034cc90   mysql:latest   "docker-entrypoint.s…"   16 seconds ago   Up 15 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql-container
        ```
    
    6. Docker 컨테이너 시작, 중지, 재시작
        ```shell
        > docker stop mysql-container       # 중지
        > docker start mysql-container      # 시작
        > docker restart mysql-container    # 재시작
        ```

    7. MySQL Docker 컨테이너 접속
        ```shell
        > docker exec -it mysql-container bash  # bash 리눅스의 powershell
        bash-5.1# mysql -u root -p
        Enter password:
        Welcome to the MySQL monitor.  Commands end with ; or \g.
        Your MySQL connection id is 9
        Server version: 9.2.0 MySQL Community Server - GPL

        Copyright (c) 2000, 2025, Oracle and/or its affiliates.

        Oracle is a registered trademark of Oracle Corporation and/or its
        affiliates. Other names may be trademarks of their respective
        owners.

        Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

        mysql> show databases;
        +--------------------+
        | Database           |
        +--------------------+
        | information_schema |
        | mysql              |
        | performance_schema |
        | sys                |
        +--------------------+
        4 rows in set (0.01 sec)
        ```
        <img src='./image/db001.png' whith='600'>
- Workbench 설치
    - https://dev.mysql.com/downloads/workbench/ MySQL Workbench 8.0.41 다운로드 설치
    - MySQL Installer에서 Workbench, Sample 만 설치

    - Workbench 실행 후
        1. MySQL Connections + 클릭

- 관계 데이터 모델
    - 3단계 DB 구조 : 외부 스키마(실세계와 매핑) -> 개념 스키마(DB논리적 설계) -> 내부 스키마(물리적 설계) -> DB

    - 모델에 쓰이는 용어

        - 릴레이션 - 테이블과 매핑
        - 속성 - 테이블 column
        - 튜플 - 테이블 row
        - 관계 - 릴레이션 간의 부모, 자식 연관
    - 무결성 제약조건

    - 키 - 기본키, 외래키, 수퍼키, 후보키, 대리키, 대체키 -개체 무결성 제약조건, 참조 무결성 제약조건, 도메인 무결성 제약조건

- SQL 기초
    - SQL 개요
    
    ```sql
    -- DML SELECT문
    SELECT publisher, price
      FROM Book
     WHERE bookname = '축구의 역사'; -- 주석입니다
    ```

## 2일차
- SQL 기초
  - 개요
      - 데이터베이스에 있는 데이터를 추출 및 처리작업을 위해서 사용되는 프로그래밍 언어
      - 일반프로그래밍언어와 차이점
        - DB에서만 문제해결 가능
        - 입출력을 모두 DB에서 테이블로 처리
        - 컴파일 및 실행은 DBMS가 수행

        - DML(데이터 조작어) - 검색, 삽입, 수정, 삭제
            - SELECT, INSERT, UPDATE, DELETE
        - DDL(데이터 정의어) 
            - CREATE, ALTER, DROP
        - DCL(데이터 제어어) 
            - GRANT, REVOKE
  
  - DML 중 SELECT
    ```sql
    -- SELECT문 기본문법
    SELECT [ALL|DISTINCT] 컬럼명(들)
      FROM 테이블명(들)
    [WHERE 검색조건(들)]
    [GROUP BY 속성이름(들)]
   [HAVING 집계함수검색조건(들)]
    [ORDER BY 정렬할 속성(들)[ASC|DESC]]
     [WITH ROLLUP]
     ```

     - 쿼리 연습(정렬까지) : [SQL](./day02//db02_select쿼리연습.sql)
     - 쿼리 연습(집계함수부터) : [SQL](./day02/db03_집계함수부터.sql)

## 3일차
- Visual Studio Code에서 MySQL 연동 
    - 확장 > MySQL 검색
        - Weijan Chen 개인개발자가 만든 MySQL 확장도 준수
        - Weijan Chen 개발한 Database Client를 설치(추천)
            - 데이터베이스 아이콘 생성
        - Oracle에서 개발한 MySQL Shell for VS Code를 사용 하지말것(너무 불편함)
        - Database Client
            1. 툴바 Database 아이콘 클릭
            2. Create Connection 클릭
            3. 정보 입력 > 연결 테스트
            <img src='./image/db002.png' whith='600'>    
            4. Workbench 처럼 사용
            <img src='./image/db003.png' whith='600'>    

- SQL 기초
  - 기본 데이터형
    - 데이터베이스는 엄청 많은 데이터형이 존재(데이터의 사이즈 저장용량을 정략하기 위해서)
    - 주요 데이터형 
        - SmallInt(2byte) - 65535가지 수(음수포함)를 저장(-32768~32767)
        - **Int(4)** - 모든 데이터차입의 기준 42억 정수(음수)를 저장
        - BigInt(8) -  Int보다 더 큰수 저장
        - Float(4) - 소수점아래 7자리까지 저장
        - Decimal(5~17) - Float보다 더 큰 수 저장시
        - Char(n) - n은 가변(1~255), 고정길이 문자열
            - 주의점! Char(10)에 hello 글자 입력하면 **'hello     '** 과 같이 저장!
        - Varchar(n) - n(1~65535). 가변길이 문자열
            - 주의점! Varchar(10)에 hello 글자 입력하면 **'hello'** 저장됨
        - Longtext(최대4GB) - 뉴스나 영화스크립트 저장할 때 사용
        - LongBlob(최대4GB) - mp3, mp4 음악, 영화데이터 자체 저장할 때 사용
        - Date(3) - 2025-02-27 까지 저장하는 타입
        - Date(8) - 2025-02-27 10:46:34 까지 저장하는 타입
        - Json(8) - json 타입 데이터를 저장
    - DDL 중 CREATE
        ```sql
        CREATE DATABASE 데이터베이스명
        [몇가지 사항];

        ALTER TABLE 테이블명
            [ADD 속성명 데이터타입]
            [DROP COLUMN 속성명]
            [ALTER COLUMN 속성명 데이터타입]
            -- ...
        ```

            - 테이블 수정
        - DDL 중 DROP

        (
            컬럼(속성)명 제약사항들, ...
            PRIMARY KEY (컬럼(들))
            FOREIGN KEY (컬럼(들)) REFERENCES 테이블명(컬럼(들)) ON 제약사항
        );
        - 테이블 생성 후 확인
            1. 메뉴 Database > Reverse Engineer(데이터베이스 ERD 변경) 클릭
            2. 연결은 패스
            3. Select Schemas to RE 에서 특정 DB를 체크

            <img src='./image/db004.png' whith='600'>  

    - DDL 중 ALTER

  - DML 중 INSERT, UPDATE, DELETE
    
- SQL 고급
    - 내장함수, NULL

## 4일차
- SQL 고급
    - 행번호 출력...

## 5일차
- 데이터베이스 프로그래밍
    - 리턴문을 쓸 수 있으면 함수, 아니면 프로시저
    - 프로시저에서도 값을 반환하려면 out 파라미터를 선언
    - 저장 프로시저 계속
        - 결과를 반환하는 프로시저 : []
    - 트리거
    - 사용자 정의함수
        - 리턴 키워드 사용

- 데이터베이스 연동 프로그래밍
    - 파이썬 db연동 콘솔
    - 파이썬 db연동 웹
    
- 데이터모델링
    - 

## 6일차
- 데이터모델링 계속 : [sql](./day06/db01_마당대학.mwb)
    - 마당대학 데이터베이스 with Workbench
    - 포워드 엔지니어링 으로 데이터베이스 생성 확인
- 정규화 ; [sql](./day06/db05_트랜잭션2.sql)
    - 이상현상 - 삽입이상, 삭제이상, 수정이상
        - 정규화를 제대로 못한 데이터베이스면 발생 가능
    - 함수 종속성 - 하나의 속성(a)이 다른 속성(b)을 결정지으면 a는 b의 결정자. a → b. a가 기본키가 됨 
        - 완전함수종속 - 종속성에 일치하지 않은 속성들이 하나도 없는 경우
        - 이행적 종속 - a → b , b → c일 때, a → c가 되는 종속성
        - bcnf 해당하지 않는 경우 - a → c, b → c일 경우 c → b 경우가 발생
    -  정규화 - 이상현상이 발생하지 않도록 릴레이션(개체, 테이블)을 분해하는 과정
        - 제1정규화 - 속성이 원자값을 가지도록 만드는 정규화(한 컬럼에 여러값이 들어갈 수 없음)
        - 제2정규화 - 모든 릴레이션의 속성이 완전함수종속을 하는 정규화
        - 제3정규화 - 이행적 종속이 발생하지 않도록 정규화
        - bcnf정규화 - 함수종속성 a → b가 성립시 모든 결정자 a가 후보키가 되는 정규화(무손실 분해)
        - 제4정규화 - 실무에서 사용안함. 다치종속성 릴레이션 가진 정규화
        - 제5정규화 - 실무에서 사용안함. 프로젝트-조인 정규형. 조인종속성을 가진 릴레이션
- 트랜잭션 - 데이터를 다루는 논리적인 작업단위
    - start transaction, 세이브포인트, 롤백 트랜잭션 처리
    - 특징
        - a - 원자성
        - c - 일관성
        - i - 고립성
        - d - 지속성
    - 동시성 제어 : [sql]
    - 락

- 데이터베이스 관리와 보완
- 실무실습


    
