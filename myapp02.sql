drop table if exists posts;

create table posts(
  id int unsigned primary key auto_increment,
  title varchar(255) unique,
  body text
);

drop table if exists comments;

create table comments(
  id int unsigned primary key auto_increment,
  post_id int not_null,
  body text
);

insert into posts(title,body) values ('初めてのブログ','ブログ始めました!');
insert into posts(title,body) values ('２回目のブログ','2回目のブログです!');

insert into comments(post_id,body) values ('1','first comment fot post 1');
insert into comments(post_id,body) values ('1','second comment fot post 1');
insert into comments(post_id,body) values ('2','first comment fot post 2');

  select * from posts;
  select * from comments;
