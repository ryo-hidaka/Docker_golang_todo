DROP SCHEMA IF EXISTS todo;
CREATE DATABASE todo;
USE todo;

DROP TABLE IF EXISTS todo;

CREATE TABLE todo.todos  (
  id serial NOT NULL PRIMARY KEY,
  user varchar(64) NOT NULL,
  content text NOT NULL,
  status TINYINT NOT NULL,
  created_at DATETIME 
);

INSERT INTO todos  VALUES (1,'ryo','動画見る',0,now());
