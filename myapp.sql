

drop table if exists users;/*ユーザーテーブルをexitしたらテーブルを消す*/

/*テーブルを作成する*/
create table users(
  id int unsigned primary key auto_increment, /*プラスの整数*/
  name varchar(20) unique, /*20バイトまでの可変長文字列(半角英数字20文字)、同じ文字列が入っているとエラーになる*/
  score float default 0.0 /*浮動少数点数、scoreの値がない場合0を挿入する*/
);

/*追加でフィールドを挿入する*/
alter table users add column email varchar(255) after name;

/*既存のフィールドを消す*/
/*alter table users drop column score;*/

/*レコードに値を挿入する*/
/*insert into users(id,name,score) values (1,'koichi',5.8);
insert into users(id,name,score) values (2,'hage',3.8);
insert into users(id,name,score) values (3,'miyaji',4);
insert into users(id,name) values (4,'yamada');
*/

/*以下のように省略することもできる*/
/*insert into users(id,name,score) values
  (5,'pes',null),
  (6,'syoichi',90),
  (7,'kenji',null),
  (8,'kenji',100);
*/

/*idをなにも入れなかったら自動的に連番になる(idをprimary keyで指定した場合)*/
insert into users(name,score) values ('hage',3.8);
insert into users(name,score) values ('miyaji',40);
insert into users(name) values ('yamada');
insert into users(name,score) values ('Koichi',20);
insert into users(name,score) values ('seiya',100);
insert into users(name,score) values ('mikuri',21);


update users set score = 40 where id =1;/*レコードの変更*/

/*トランザクション処理*/

start transaction;
  update users set score = score -20 where name = 'miyaji';
  update users set score = score +20 where name = 'Koichi';
commit;

/*delete from users where score < 30; */ /*指定した条件に満たないユーザーは削除*/

select * from users; /*すべてのフィールドを抽出する*/

select id, name from users; /*idと名前だけ抽出する*/

select * from users where score >= 20 and score <= 90; /*指定の条件つきでレコードを抽出する*/

select * from users where score between 20 and 90;/*上と同じ表示になる*/

select * from users where name in ('miyaji','seiya'); /*inの中の条件のレコードを抽出する*/

select * from users where name like 'y%'; /*yから始まる文字列を抽出する*/

select * from users where name like '%mi%'; /*miを含む文字列を抽出する*/

select * from users where name like binary 'K%'; /*大文字のKから始まる文字列を抽出する*/

select * from users where score is not null order by score; /*nullを省いて値が小さい順にソートする*/

select * from users limit 3; /*3名のみ表示*/

select * from users order by score desc limit 3; /*スコアが上位3名を表示する*/

/*if文*/
select
   name,
   score,
   if(score > 5.0, 'OK','NG') as result
 from
   users;

/*case文*/
select
   name,
   score,
   case floor(score) % 2
    when 0 then 'even'
    when 1 then 'odd'
    else null
  end as type
 from
   users;

drop table if exists users_with_team;

create table users_with_team as
select
    id,
    name,
    score,
    case
      when score > 100 then 'Team-A'
      when score > 30 then 'Team-B'
      when score > 20 then 'Team-C'
      else 'Team-else'
    end as team
  from
    users;

  select * from users_with_team;

  select count(*) from  users_with_team; /*全体の行数をカウントしたものを表示する*/

  select sum(score) from  users_with_team;  /*全体の合計値をカウントしたものを表示する*/
  select min(score) from  users_with_team;
  select max(score) from  users_with_team;
  select avg(score) from  users_with_team;

  /*チームごとの合計値を表示する*/
  select sum(score), team from users_with_team group by team;
