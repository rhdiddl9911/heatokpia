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