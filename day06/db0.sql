-- 7-1 계절학기 테이블 
drop table if exist summer;

create table summer (
sid integer,
class varchar(20),
price integer
);

-- 
select * from summer;

-- 기본데이터 추가(mysql에서 한번에 다중데이터 insert)
insert into summer values(100,'java',20000),(150,'python',15000),(200,'c',10000)