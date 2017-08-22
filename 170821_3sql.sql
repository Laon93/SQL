drop table author;
drop sequence seq_author;


create sequence seq_author start with 1 increment by 1 maxvalue 999999999;

create table author(
no number(10),
name nvarchar2(200) not null,
profile nvarchar2(2000),

primary key (no)
);

drop table book;
drop sequence seq_book;

alter table book drop constraint c_book_check;
alter table book drop constraint c_book_fk;
--모든 조건들을 다 지웠다가 만들어줘야한다 오라클.. 정말 귀찮군
create sequence seq_book start with 1 increment by 1 maxvalue 999999999;
CREATE TABLE book(
no number(10) ,
title varchar2(120) not null ,
author_no number(10) not null ,
state varchar2(12) not null,
pub_date date,

primary key (no),
constraint c_book_fk foreign key(author_no) references author(no)
-- 참조키가 삭제시 함께 삭제되겠다.
-- on delete cascade ,
-- 위의 방법도 있지만, 참조키 삭제시 null 셋팅하는 아래의 방법도 있다.
-- 하지만 아래의 방법 이용시 not null 셋팅이 되어있으면 사용이 불가능하다
on delete set null,
constraint c_book_check check(state in ('대여중', '대여가능'))
);

insert into author values(seq_author.nextval, 'sdf', null);
select * from author;

insert into book values(seq_book.nextval, '토지', 1, '대여가능', sysdate);

select * from book;

