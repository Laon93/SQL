-- 모든 사용자 확인
select * from all_users;
select * from dba_users;

create user kickscar identified by "kickscar";

-- 권한주기
grant create session to kickscar;

-- 권한 빼앗기
revoke create session from kickscar;

-- 롤 단위로 권한 주고 , 빼앗기
grant connect, resource to kickscar;
revoke connect, resource from kickscar;

drop user kickscar;

--run sql command line 에서 실행
create user kickscar identified by kickscar;
grant create session to kickscar;
--dev가 가지고 있는 book이라는 곳에 접근하여 select 문만 실행할 수 있다.
grant select on dev.book to kickscar;


conn /as sysdba;
create role viewer;
grant create session to viewer;
grant select on dev.book to viewer;
grant viewer to kickscar;
select * from dev.book;

revoke viewer from kickscar;
conn kickscar/kickscar; 