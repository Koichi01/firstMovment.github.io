drop database if exists myapp02;
create database myapp02;
create user myapp_user02@localhost identified by '1031';
grant all on myapp02.* to myapp_user02@localhost;
