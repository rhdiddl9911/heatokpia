DROP TABLE Member;

CREATE TABLE Member (
       id            		VARCHAR(20) NOT NULL,
       password             VARCHAR(100) NOT NULL,
       email                VARCHAR(50) NULL,
       name                 VARCHAR(20) NOT NULL,
       satus                VARCHAR(1) NULL,
       role                 VARCHAR(10) NULL
);
ALTER TABLE Member ADD  ( PRIMARY KEY (id) ) ;


DROP TABLE board;

CREATE TABLE board (
       board_seq            INTEGER NOT NULL,
       content              CLOB NULL,
       createdate           DATE NULL,
       updatedate           DATE NULL,
       --like_count           INTEGER NULL,
       password             VARCHAR(100) NULL,
       name                 VARCHAR(20) NULL,
       --ip                   VARCHAR(15) NULL,
       category             VARCHAR(1) NOT NULL,
       best_tf              VARCHAR(1) NULL,
       hit                  INTEGER NULL,
       member_id            VARCHAR(20) NULL,
       title                VARCHAR(200) NULL
);
ALTER TABLE board ADD  ( PRIMARY KEY (board_seq) ) ;

DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq
START WITH 1 
INCREMENT BY 1 
MINVALUE 1 NOCYCLE;
  --MAXVALUE 1000
