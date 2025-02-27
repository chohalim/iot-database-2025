-- 내장함수
-- 4-1 -78과 78 절대값을 구하시오
select abs(-78), abs(78); -- 테이블에서 가져올때만 from씀

-- 4-2 4.875를 소수점 첫번째 자리까지 반올림 하시오.
select round(4.875,1) as 결과; 

-- 4-3 고객별 평균 주문 금액을 100원 단위로 반올림한 값을 구하시오.
select custid, round(sum(saleprice)/count(*),-2) as '평균금액'
from Orders
group by custid;

-- 문자열 내장함수
-- 4-4 도서 제목에서 야구가 포함된 도서명을 농구로 변경한 후 출력하시오.
select bookid
, replace(bookname,'야구','농구') as bookname
, publisher
, price
from Book;

-- 추가
select 'Hello' 'MySQL';

select concat('Hello', 'MySQL', 'wow');

-- 4-5 굿스포츠에서 출판한 도서의 제목과 제목의 문자수, 바이트수를 구하시오.
select bookname as '제목'
, char_length(bookname) as '제목 문자수' -- 글자 길이를 구할 때
, length(bookname) as '제목 바이트수' -- utf8에서 한글 한글자의 바이트수는 3bytes
from Book
where publisher = '굿스포츠';

-- 4-6 고객 중 성이 같은 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
-- substr(자를 원본 문자열, 시작인덱스, 길이)
-- DB는 인덱스를 1부터 시작! (프로그래밍언어와 차이점)
select substr('성유고',2,2);

select substr(name, 1, 1) as '성씨 구분'
, count(*) as '인원수'
from Customer
group by substr(name, 1, 1);

-- 추가 trim, Python의 strip()과 동일
select concat('--',trim('     hello!     '),'--');
select concat('--',ltrim('     hello!     '),'--');
select concat('--',rtrim('     hello!     '),'--');

-- 새롭게 추가된 trim() 함수 기능
select trim('=' from'=== -hello- ===');

-- 날짜 시간 함수
select sysdate(); -- Docker 서버시간을 따라서 GMT(그리니치 표준시)를 따름 +9hour

select adddate(sysdate(), interval 9 hour) as '한국시간';

-- 4-7 마당서점은 주문일부터 10일 후에 매출을 확정합니다. 각 주문의 확정일자를 구하시오.
select orderid as '주문번호'
, orderdate as '주문일자'
, adddate(orderdate, interval 10 day) as '확정일자'
from Orders;

-- 추가, 나라별 날짜, 시간 표현하는 포맷이 다름
select sysdate() as '기본날짜/시간'
, date_format(sysdate(), '%M/%d/%Y %H:%m:%s');

-- 4-8 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 나타내시오.
-- 단, 주문일은 %Y-%m-%d 형태로 표시한다.
-- %Y = 년도전체, %y = 년도 뒤 2자리, %M = July(월이름), %b = Jul(월약어), %m = 07(월숫자)
-- %d = 일, %H = 16, %h = 04(오후도), %W = Monday, %w = 1(요일은 일요일 0)
-- %p = AM/PM
select orderid as '주문번호'
, date_format(orderdate, '%Y/%b/%d') as '주문일'
, custid as '고객번호'
, bookid as '도서번호'
from Orders;

-- datediff: d-day
select datediff(sysdate(), '2025-02-03');

-- NULL = Python None 동일. 모든 다른 프로그래밍 언어에서는 전부 NULL, NUL
-- 추가. 금액이 NULL일 때 발생되는 현상
select *
from MyBook
WHERE bookid = 3;

-- 핵심. 집계함수가 다 꼬임
select sum(price) as '합산은 그닥 문제없음'
, avg(price) as '평균은 NULL이 빠져서 꼬임'
, count(*) as '모든 행의 갯수는 일치'
, count(price) as 'NULL값은 갯수에서 빠짐'
from MyBook;

-- Formatting, 1000 단위마다 , 넣기
select bookid
, format(price, 0) as price
from MyBook;

-- NULL값 확인. NULL은 비교연산자 (=, >, <, <>, ...) 사용불가
-- IS 키워드 사용
select *
from MyBook
where price IS NULL; -- 반대는 IS NOT NULL
 
-- IFNULL 함수
select bookid
, bookname
, ifnull(price,0) as price -- 0으로 보일뿐, 삽입되는 것 아님
from MyBook;