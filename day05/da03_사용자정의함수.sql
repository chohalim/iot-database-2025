-- 사용자 정의함수. 내장함수 반대. 개발자가 직접 만드는 함수
-- 저장프로시저와 유사. returns, return 키워드가 차이남
select char_length('Hello World');

delimeter //
create function fnc_Interest(
	price integer
)return int
begin
declare myinterest integer;
	if price >= 30000 then set myinterest = price * 0.1;
	else set myinterest = price * 0.05;
	end if;
	return myinterest;
end;

-- 실행
select custid, orderid, saleprice, fnc_interest(saleprice) as '이익금'