create table author(author_id varchar(10), names varchar(20),email varchar(50),phone_number number(20),status varchar(20),primary key(author_id));
create table publisher(publisher_id varchar(10), pubname varchar(20), address varchar(50), primary key(publisher_id));
create table members(member_id varchar(20),membername varchar(30),branch_code varchar(20),roll_number varchar(10),phone_number number(20),email_id varchar(50),date_of_join number(30),status varchar(20),primary key(member_id));
create table languages(language_id varchar(20),langname varchar(20),primary key(language_id));
create table book(book_id varchar(20),title varchar(20),language_id varchar(20),mrp number(10),publisher_id varchar(10),published_date varchar(10),volume varchar(20),status varchar(10),primary key(book_id),foreign key(language_id) references languages(language_id),foreign key(publisher_id) references publisher(publisher_id));
create table book_author(book_id varchar(20),author_id varchar(10),primary key(book_id,author_id),foreign key(book_id) references book(book_id),foreign key(author_id) references author(author_id));
create table book_issue(issue_id varchar(20),date_of_issue varchar(10),book_id varchar(20),member_id varchar(20),expected_date_of_return varchar(20),status varchar(20),primary key(issue_id),foreign key(book_id) references book(book_id),foreign key(member_id) references members(member_id));
create table book_return(issue_id varchar(20),actual_date_of_return varchar(20),late_days varchar(10),late_fee varchar(10),primary key(issue_id),foreign key(issue_id) references book_issue(issue_id));
create table late_fee_rule(from_days number(10),to_days number(20),amount number(20));
commit;

insert into author values('a1','chetan bhagat','cb@gmail.com',9080706050,'available');
insert into author values('a2','Jane Austin','ja@gmail.com',9181716151,'available');
select * from author;

insert into publisher values('p1','blooms','abc house,xyz city,new delhi');
insert into publisher values('p2','DC books','pqr house,abc city,new delhi');
select * from publisher;

insert into members values('m1','john','branch1',001,5060708090,'john@gmail.com','1/1/01','available');
insert into members values('m2','mary','branch2',002,5161718191,'mary@gmail.com','20/2/2002','available');
select * from members;

insert into languages values('L1','english');
insert into languages values('L2','malayalam');
select * from languages;

insert into book values('b1','2 states','L1',125,'p1','1/1/01','v1','available');
insert into book values('b2','pride','L2',500,'p2','1/1/20','v2','available');
select * from book;

--update table book set book_id='b1' where book_id=1;
--delete from book where book_id='b1';
--alter table book_issue modify expected_date_of_return date;

insert into book_issue values('bI1','12/8/24','b1','m1','20/8/24','available');
insert into book_issue values('bI2','15/8/24','b1','m1','25/8/24','available');
select * from book_issue;

insert into book_author values('b1','a1');
insert into book_author values('b2','a2');
select * from book_author;

--alter table book_return modify actual_date_of_return date;

insert into book_return values('bI1','20/8/24',0,0);
insert into book_return values('bI2','25/8/24',5,10);
select * from book_return;

insert into late_fee_rule values(0,7,10);
insert into late_fee_rule values(7,30,100);
select * from late_fee_rule;

alter table book add pages varchar(20);
select * from book;

alter table members modify date_of_join date;

alter table late_fee_rule rename to fine_table;
desc fine_table;
commit;

drop table book_author;
drop table author;
desc author;

select* from author;
select * from user_constraints where table name='book';
select * from user_constraints where table name='publisher';
