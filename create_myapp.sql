drop database if exists myapp;
create database myapp;
create user myapp_user@localhost identified by '1031';
grant all on myapp.* to myapp_user@localhost;
