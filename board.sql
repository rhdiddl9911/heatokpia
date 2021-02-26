-- ON DELETE CASCADE
-- ON DELETE SET NULL

CREATE TABLE Member (
       id                   VARCHAR2(20) NOT NULL,
       password             VARCHAR2(100) NOT NULL,
       email                VARCHAR2(100) NOT NULL,
       name                 VARCHAR2(20) NOT NULL,
       satus                VARCHAR2(1) NULL,
       role                 VARCHAR2(10) NULL,
       PRIMARY KEY (id)
);






CREATE TABLE board (
       seq                  INTEGER NOT NULL,
       content              VARCHAR2(3000) NULL,
       createdate           DATE NULL,
       updatedate           DATE NULL,
       like_count           INTEGER NULL,
       name                 VARCHAR2(30) NULL,
       ip                   VARCHAR2(15) NULL,
       password             VARCHAR2(100) NULL,
       category             VARCHAR2(1) NULL,
       best                 VARCHAR2(1) NULL,
       hit                  INTEGER NULL,
       id                   VARCHAR2(20) NULL,
       title                VARCHAR2(300) NULL,
       PRIMARY KEY (seq)
);


ALTER TABLE board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;

                             
DROP SEQUENCE seq_board;

CREATE SEQUENCE seq_board
INCREMENT BY 1
MINVALUE 1
NOCYCLE;


CREATE TABLE board_comment (
       seq                  INTEGER NOT NULL,
       board_seq            INTEGER NOT NULL,
       password             VARCHAR2(100) NULL,
       name                 VARCHAR2(30) NOT NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NULL,
       ip			        VARCHAR2(15) NOT NULL,
       content              VARCHAR2(900) NOT NULL,
       PRIMARY KEY (seq)
);


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member  ) ;


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ON DELETE CASCADE)  ;

DROP SEQUENCE seq_board_comment;

CREATE SEQUENCE seq_board_comment
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE board_thislike (
       board_seq            INTEGER NOT NULL,
       ip                   VARCHAR2(15) NOT NULL,
       createDate           DATE NULL,
       PRIMARY KEY (board_seq, ip)
);

ALTER TABLE board_thislike
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ON DELETE CASCADE) ;

