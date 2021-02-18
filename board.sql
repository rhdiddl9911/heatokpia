-- ON DELETE CASCADE
-- ON DELETE SET NULL

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
       password             VARCHAR2(50) NULL,
       name                 VARCHAR2(20) NOT NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NULL,
       content              VARCHAR2(300) NOT NULL,
       PRIMARY KEY (seq)
);


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE board_comment
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ) ;

DROP SEQUENCE seq_board_comment;

CREATE SEQUENCE seq_board_comment
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE likepost (
       board_seq            INTEGER NOT NULL,
       ip                   VARCHAR2(15) NOT NULL,
       createDate           DATE NULL,
       PRIMARY KEY (board_seq, ip)
);

ALTER TABLE likepost
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ) ;


                             
create trigger tD_board after DELETE on board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- DELETE trigger on board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* board R/31 likepost ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from likepost
      where
        /*  likepost.board_seq = :old.seq */
        likepost.board_seq = :old.seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE board because likepost exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* board R/6 board_comment ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from board_comment
      where
        /*  board_comment.board_seq = :old.seq */
        board_comment.board_seq = :old.seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE board because board_comment exists.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_board after INSERT on board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/8 board ON CHILD INSERT SET NULL */
    update board
      set
        /* board.id = NULL */
        board.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* board.seq = :new.seq */
        board.seq = :new.seq;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_board after UPDATE on board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* board R/31 likepost ON PARENT UPDATE RESTRICT */
  if
    /* :old.seq <> :new.seq */
    :old.seq <> :new.seq
  then
    select count(*) into numrows
      from likepost
      where
        /*  likepost.board_seq = :old.seq */
        likepost.board_seq = :old.seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE board because likepost exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* board R/6 board_comment ON PARENT UPDATE RESTRICT */
  if
    /* :old.seq <> :new.seq */
    :old.seq <> :new.seq
  then
    select count(*) into numrows
      from board_comment
      where
        /*  board_comment.board_seq = :old.seq */
        board_comment.board_seq = :old.seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE board because board_comment exists.'
      );
    end if;
  end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/8 board ON CHILD UPDATE SET NULL */
    update board
      set
        /* board.id = NULL */
        board.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* board.seq = :new.seq */
        board.seq = :new.seq;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_board_comment after INSERT on board_comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on board_comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/16 board_comment ON CHILD INSERT SET NULL */
    update board_comment
      set
        /* board_comment.id = NULL */
        board_comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* board_comment.seq = :new.seq */
        board_comment.seq = :new.seq;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* board R/6 board_comment ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from board
      where
        /* :new.board_seq = board.seq */
        :new.board_seq = board.seq;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT board_comment because board does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_board_comment after UPDATE on board_comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on board_comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/16 board_comment ON CHILD UPDATE SET NULL */
    update board_comment
      set
        /* board_comment.id = NULL */
        board_comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* board_comment.seq = :new.seq */
        board_comment.seq = :new.seq;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* board R/6 board_comment ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from board
    where
      /* :new.board_seq = board.seq */
      :new.board_seq = board.seq;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE board_comment because board does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_likepost after INSERT on likepost for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on likepost 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* board R/31 likepost ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from board
      where
        /* :new.board_seq = board.seq */
        :new.board_seq = board.seq;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT likepost because board does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_likepost after UPDATE on likepost for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on likepost 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* board R/31 likepost ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from board
    where
      /* :new.board_seq = board.seq */
      :new.board_seq = board.seq;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE likepost because board does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/
