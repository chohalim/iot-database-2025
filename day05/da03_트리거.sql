-- 트리거
-- 시작전 설정 변경
-- 다음 버전 MySQL에서는 사라질 예정(Deprecated)
set grobal log_bin_trust_function_creators = ON;

-- Book_log 테이블을 생성
create table Book_log(
bookid_l integer,
bookname_l varchar(40),
publisher_l varchar(40),
price_l integer
);

-- 트리거 생성
-- UPDATE나 DELETE 시는 old. 라고 사용 after update on 테이블명...
-- before insert, update, delete ...
 delimiter //
 create trigger afterinsertbook
 after insert on Book for each row /* 트리거가 Book테이블에 데이터가 새로 추가되면 바로 발동! */
 begin
	declare avarage integer;
    insert into book_log
    values (new.bookid, new.bookname, new.publisher, new.price);
 end;

-- Book테이블에 INSERT 실행Book, 트리거는 Book테이블에 새로운 데이터가 들어오면 자동으로 실행됨.
INSERT INTO Book values (40, '안드로이드는 전기양의 꿈을 꾸는가', '이상미디어', 25000);