--Data Dictionary

select * from dictionary;
select * from user_objects;
select * from user_objects where object_type = 'TABLE';

select * from user_users;
select * from all_users;
-- 관리자 권한으로 접근해야 출력이 가능하다.
-- select * from dba_users;

select * from user_constraints;
-- 대부분 대문자로 저장되어있기 때문에 BOOK이나 TABLE과 같이 모두 대문자로 적어주어야한다.
select * from user_constraints where table_name = 'BOOK';

select * from user_users;


-- DML
insert into author values(seq_author.nextval, '둘리' , null);

select * from author;

delete from author where no is null;

update author set name = '도우넛', profile = 'aaaaa'
where no = 1;


insert into author values (seq_author.nextval , 'aaa','asdf');
select * from author;

insert into author values(seq_author.nextval, 'ddd', 'asdfe');
select * from author;

commit;
rollback;

-- savepoint를 저장해두어 원하는 위치로 rollback;을 하는것 
savepoint a;
rollback to a;

insert into author values(4, 'ddd', 'asdfe');
select * from author;
commit;
























