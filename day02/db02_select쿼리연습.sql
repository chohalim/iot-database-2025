-- 쿼리 3-1: 모든 도서의 이름과 가격을 검색하시오.
SELECT bookname, price
  FROM Book;
  
-- 워크밴치에서 쿼리 실행할 땐 편함
  SELECT *
    FROM Book;

-- 3-2 : 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
-- 파이썬, C# 등 프로그래밍언어로 가져갈 땐, 컬럼이름 컬럼갯수 모두 파악위해 아래처럼 사용
SELECT bookid, bookname, publisher, price
  FROM Book;
  
-- 3-3 : 도서 테이블의 모든 출판사를 검색하시오.
-- 출판사별 중복제거 원함
-- ALL - 전부다, DISTINCT - 중복제거
SELECT DISTINCT publisher
  FROM Book;
  
-- 3-4 : 도서 중 가격이 20000원 미만인 것을 검색하시오.
-- > 미만 < 초과 >= 이하 <>, != 같지 않다 = 같다(프로그래밍언어와 차이)
SELECT *
  FROM Book
 WHERE price < 20000;
 
-- 3-5 : 가격이 10000원 이상 20000원 이하인 도서를 검색하시오.
SELECT *
  FROM Book
 WHERE price >= 10000 AND price <= 20000;
 
SELECT *
  FROM Book
 WHERE price BETWEEN 10000 AND 20000;
 
-- 3-6, 3-11 : 출판사가 '굿스포츠' 또는 '대한미디어'인 도서를 검색하시오.
SELECT *
  FROM Book
 WHERE publisher = '굿스포츠' OR publisher = '대한미디어';
 
SELECT *
  FROM Book
 WHERE publisher IN('굿스포츠', '대한미디어');
 
 SELECT *
  FROM Book
 WHERE publisher NOT IN('굿스포츠', '대한미디어');
 
 -- 3-7 : '축구의 역사'를 출간한 출판사를 검색하시오.
SELECT publisher
  FROM Book
 WHERE bookname = '축구의 역사';
 
-- 패턴
-- % 갯수와 상관없이 글자가 포함되는 것
-- [0-5] 1개의 문자가 일치, 한글자 0에서 5의 숫자를 포함한다. 여기선 안됨
-- [^] 1개의 문자가 일치하지 않는 것
-- _ 특정위치의 1개의 문자가 일치할 때 
--           _구 : 첫번째 글자는 뭐든지 상관없고 갯수는 한개, 두번째BookBook 글자가 구로되고 뒤에 글이 있음
SELECT *
  FROM Book
 WHERE bookname LIKE '_구%';
 
-- 추가 : 고객중에서 전화번호가 없는 사람을 검색하시오.
SELECT *
  FROM Customer
 WHERE phone IS Null;
 
SELECT *
  FROM Customer
 WHERE phone IS NOT Null; 
 
-- 3-10: 축구에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오.
SELECT *
  FROM Book
 WHERE bookname LIKE '%축구%' AND price >= 20000; 
 
-- 3-12 : 도서를 이름순(오름차순)으로 검색하시오.
-- ASC(ending) DESC(ending)
SELECT *
  FROM Book
-- ORDER BY bookname ASC;
-- ORDER BY bookname; -- 오름차순은 기본이라 생략가능
ORDER BY price DESC;

-- 3-13 : 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
SELECT *
  FROM Book
 ORDER BY price, bookname;
 
-- 3-14 : 도서 가격을 내림차순으로 검색하시오. 가격이 같다면 출판사를 오름차순으로 출력하시오.
SELECT *
  FROM Book
 ORDER BY price DESC, publisher;