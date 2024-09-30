grant select on bank to c22csa65;--to grant select permission to another user
revoke select on bank from c22csa65;--to take back the grant permission given to another user
select * from c22csa65.book_issue;
update c22csa65.book_issue set date_of_join='31/12/2005' where issue_id=4001;--updating another user table values

commit;
grant all on bank to c22csa65;
