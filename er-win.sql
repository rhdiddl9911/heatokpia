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


DROP TABLE news CASCADE CONSTRAINTS;

CREATE TABLE news (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(600) NOT NULL,
       content              CLOB NOT NULL,
       authorship           VARCHAR2(300) NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
       url                  VARCHAR2(200) NULL,
       PRIMARY KEY (seq)
);

ALTER TABLE news
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;
                  
DROP SEQUENCE seq_news;

CREATE SEQUENCE seq_news
INCREMENT BY 1
MINVALUE 1
NOCYCLE;


DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;

CREATE TABLE notice_board (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(300) NOT NULL,
       content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       updatedate           DATE NULL,
       id                   VARCHAR2(20) NOT NULL,
       category	    		VARCHAR2(1) NOT NULL,
       PRIMARY KEY (seq)
);

ALTER TABLE notice_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;
                             
DROP SEQUENCE seq_notice_board;

CREATE SEQUENCE seq_notice_board
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

select * from NOTICE_BOARD;

CREATE TABLE q_board (
       content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       anser                VARCHAR2(1) NULL,
       id                   VARCHAR2(20) NOT NULL,
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(300) NOT NULL,
       PRIMARY KEY (seq)
);

CREATE TABLE a_board (
       content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       q_seq                INTEGER NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
       PRIMARY KEY (q_seq)
);

ALTER TABLE q_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;

ALTER TABLE a_board
       ADD  ( FOREIGN KEY (q_seq)
                             REFERENCES q_board ) ;

ALTER TABLE a_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;

DROP SEQUENCE seq_q_board;

CREATE SEQUENCE seq_q_board
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

drop TRIGGER a_intrigger;

CREATE TRIGGER a_intrigger
	AFTER INSERT ON a_board
	FOR EACH ROW
	BEGIN 
		UPDATE q_board q
		SET q.anser = 1 
		WHERE q.seq = :new.q_seq;
	END; 

SELECT * FROM ALL_TRIGGERS;

	