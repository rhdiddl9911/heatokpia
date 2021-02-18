
CREATE TABLE a_board (
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       q_seq                INTEGER NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
       PRIMARY KEY (q_seq)
);


CREATE TABLE board (
       seq                  INTEGER NOT NULL,
       content              VARCHAR2(1000) NULL,
       createdate           DATE NULL,
       updatedate           DATE NULL,
       like_count           INTEGER NULL,
       name                 VARCHAR2(20) NULL,
       ip                   VARCHAR2(15) NULL,
       password             VARCHAR2(100) NULL,
       category             VARCHAR2(1) NULL,
       best                 VARCHAR2(1) NULL,
       hit                  INTEGER NULL,
       id                   VARCHAR2(20) NULL,
       title                VARCHAR2(100) NULL,
       PRIMARY KEY (seq)
);


CREATE TABLE board_comment (
       seq                  INTEGER NOT NULL,
       board_seq            INTEGER NOT NULL,
       password             VARCHAR2(50) NULL,
       name                 VARCHAR2(20) NOT NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NULL,
       content              VARCHAR2(300) NOT NULL,
       PRIMARY KEY (seq)
);


CREATE TABLE finance_comment (
       ip                   VARCHAR2(15) NOT NULL,
       seq                  INTEGER NOT NULL,
       content              VARCHAR2(300) NOT NULL,
       password             VARCHAR2(50) NULL,
       name                 VARCHAR2(20) NOT NULL,
       id                   VARCHAR2(20) NULL,
       createdate           DATE NOT NULL,
       finance_id           VARCHAR2(100) NOT NULL,
       PRIMARY KEY (seq)
);


CREATE TABLE likepost (
       board_seq            INTEGER NOT NULL,
       ip                   VARCHAR2(15) NOT NULL,
       createDate           DATE NULL,
       PRIMARY KEY (board_seq, ip)
);


CREATE TABLE Member (
       id                   VARCHAR2(20) NOT NULL,
       password             VARCHAR2(100) NOT NULL,
       email                VARCHAR2(100) NOT NULL,
       name                 VARCHAR2(20) NOT NULL,
       satus                VARCHAR2(1) NULL,
       role                 VARCHAR2(10) NULL,
       PRIMARY KEY (id)
);


CREATE TABLE news (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL,
       content              VARCHAR2(1000) NOT NULL,
       authorship           VARCHAR2(100) NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
       url                  VARCHAR2(200) NULL,
       PRIMARY KEY (seq)
);


CREATE TABLE notice_board (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL,
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       updatedate           DATE NULL,
       hit                  INTEGER NULL,
       id                   VARCHAR2(20) NOT NULL,
       PRIMARY KEY (seq)
);


CREATE TABLE q_board (
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       anser                VARCHAR2(1) NULL,
       id                   VARCHAR2(20) NOT NULL,
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL,
       PRIMARY KEY (seq)
);


ALTER TABLE a_board
       ADD  ( FOREIGN KEY (q_seq)
                             REFERENCES q_board ) ;


ALTER TABLE a_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ) ;


ALTER TABLE finance_comment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE likepost
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ) ;


ALTER TABLE news
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE notice_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE q_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;





