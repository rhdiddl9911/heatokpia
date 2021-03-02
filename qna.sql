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