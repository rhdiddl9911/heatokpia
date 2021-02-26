--DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;

CREATE TABLE notice_board (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(300) NOT NULL,
       content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       updatedate           DATE NULL,
       hit                  INTEGER NULL,
       id                   VARCHAR2(20) NOT NULL,
       PRIMARY KEY (seq)
);

ALTER TABLE notice_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;