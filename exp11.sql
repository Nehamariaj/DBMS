grant select on bank to c22csa65;
revoke select on bank from c22csa65;
select * from c22csa65.book_issue;
update c22csa65.book_issue set date_of_join='31/12/2005' where issue_id=4001;

commit;
grant all on bank to c22csa65;
