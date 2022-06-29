create table board
(
	idx int not null auto_increment,
	title varchar(100) not null,
	writer varchar(100) not null,
	content varchar(2000) not null,
	indate datetime default now(),
	count int default 0,
	
	primary key(idx)
);

insert into board(title, writer, content)
values('스프링 게시판 테스트', '이설아', '스프링 게시판 만들기');
insert into board(title, writer, content)
values('스프링 게시판 테스트', '안현진', '스프링 게시판 만들기');

select * from board;