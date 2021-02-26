DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;
select * from NOTICE_BOARD;
CREATE TABLE notice_board (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(300) NOT NULL,
       content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       updatedate           DATE NULL,
       hit                  INTEGER NULL,
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