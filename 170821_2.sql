drop table book;

CREATE TABLE book(
no number(10),
title varchar2(120),
author varchar2(50),
pub_date date);

--error 5byte를 넘음, '가나' -> 6byte
insert into book values(1, '토지', '가나', sysdate);

insert into book values(1, '토지', '가12', sysdate);
select * from book;

select rowid, no from book;

select * from book;
--새 컬럼 추가
alter table book add(pubs varchar2(120));
select * from book;

alter table book modify(pubs varchar2(200));

alter table book rename column pubs to publishing; 

alter table book drop column publishing;

select * from book;

--author을 사용하지 않겠다.
--그런데 author을 사용하겠다라고 변경하는 것이 없다. 그렇기 때문에 이건 매우 신중하게 생각하여 사용해야한다.
alter table book set unused(author);
--사용하지 않겠다고 해둔 컬럼을 한번에 지운다
--이거는 서비스를 제공하는 중이라 unused만 해놓고 나중에 지워야하는 경우에 unused만 해두고 시간이 될때 삭제한다 
alter table book drop unused columns;

--table에 데이터를 다 날리겠다
truncate table book;
select * from book;

--table과 데이터를 모두 삭제하겠다.
drop table book;

--comment
comment on table book is '북정보를 저장하는 테이블';
select * from book;

--constraints
drop table book;

CREATE TABLE book(
no number(10) ,
title varchar2(120) not null ,
author varchar2(50) not null ,
pub_date date,

primary key (no)
);

--primary key ==> not null + 중복불가 (unique)
insert into book
values (1, '토지', '박경리' , sysdate);

select * from book;


-- 문제 발생!! 
-- 비슷한 시간에 같은 insert문이 수행될 때, max(no)의 값을 동일하게 출력하게 될 수 있는데
-- 그렇게 된다면 문제가 발생하게 된다. 그렇기 때문에 아래의 방법으로 사용하면 안되고 sequence를 사용해야한다.
insert into book
values((select max(no) from book) + 1, 'aa','as',sysdate);

-- create sequence
drop sequence seq_book;
create sequence seq_book start with 1 increment by 1 maxvalue 999999999; 

select seq_book.nextval from dual;
select seq_book.currval from dual;


-- 쿼리 안에 쿼리가 들어가는 경우에는 이렇게 사용하는게 맞는지에 대해 더 고민해볼 필요가 있다.
insert into book
values(seq_book.nextval, 'aa','as',sysdate);

select * from book;

drop table book;

CREATE TABLE book(
no number(10) ,
title varchar2(120) not null ,
author varchar2(50) not null ,
state varchar2(12) not null,
pub_date date,

primary key (no),
constraint c_book_check check(state in ('대여중', '대여가능'))
);

insert into book
values (1, '토지', '박경리', '대여중' , sysdate);

select * from book;

insert into book
values (seq_book.nextval, '토지', '박경리','kk' , sysdate);




