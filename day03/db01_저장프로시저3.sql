-- 5-3 : Book 테이블에 저장된 도서 평균 가격 반환 프로시저
delimiter //
-- 파라미터 in - 값을 함수로 전달
-- 파라미터 out - 프로시저에서 리턴값을 보내는 매개변수 
create procedure AveragePrice(
out val integer
)
begin
select avg(price) into val
from Book where price is not null;
end;

-- 프로시저를 실행할 때는 Ctrl+Enter 제대로 실행안됨, 마우스로 드래그하고 마우스로 번개아이콘 클릭
call AveragePrice(@myValue);
select @myValue;