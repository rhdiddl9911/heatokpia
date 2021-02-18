
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


CREATE TABLE comment (
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


ALTER TABLE comment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE comment
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




create trigger tI_a_board after INSERT on a_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on a_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* q_board R/30 a_board ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from q_board
      where
        /* :new.q_seq = q_board.seq */
        :new.q_seq = q_board.seq;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT a_board because q_board does not exist.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/29 a_board ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from Member
      where
        /* :new.id = Member.id */
        :new.id = Member.id;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT a_board because Member does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_a_board after UPDATE on a_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on a_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* q_board R/30 a_board ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from q_board
    where
      /* :new.q_seq = q_board.seq */
      :new.q_seq = q_board.seq;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE a_board because q_board does not exist.'
    );
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/29 a_board ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from Member
    where
      /* :new.id = Member.id */
      :new.id = Member.id;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE a_board because Member does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

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
    /* board R/6 comment ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from comment
      where
        /*  comment.board_seq = :old.seq */
        comment.board_seq = :old.seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE board because comment exists.'
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
  /* board R/6 comment ON PARENT UPDATE RESTRICT */
  if
    /* :old.seq <> :new.seq */
    :old.seq <> :new.seq
  then
    select count(*) into numrows
      from comment
      where
        /*  comment.board_seq = :old.seq */
        comment.board_seq = :old.seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE board because comment exists.'
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

create trigger tI_comment after INSERT on comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/16 comment ON CHILD INSERT SET NULL */
    update comment
      set
        /* comment.id = NULL */
        comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* comment.seq = :new.seq */
        comment.seq = :new.seq;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* board R/6 comment ON CHILD INSERT RESTRICT */
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
        'Cannot INSERT comment because board does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_comment after UPDATE on comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/16 comment ON CHILD UPDATE SET NULL */
    update comment
      set
        /* comment.id = NULL */
        comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* comment.seq = :new.seq */
        comment.seq = :new.seq;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* board R/6 comment ON CHILD UPDATE RESTRICT */
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
      'Cannot UPDATE comment because board does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_finance_comment after INSERT on finance_comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on finance_comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/18 finance_comment ON CHILD INSERT SET NULL */
    update finance_comment
      set
        /* finance_comment.id = NULL */
        finance_comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* finance_comment.seq = :new.seq */
        finance_comment.seq = :new.seq;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_finance_comment after UPDATE on finance_comment for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on finance_comment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/18 finance_comment ON CHILD UPDATE SET NULL */
    update finance_comment
      set
        /* finance_comment.id = NULL */
        finance_comment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* finance_comment.seq = :new.seq */
        finance_comment.seq = :new.seq;


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

create trigger tD_Member after DELETE on Member for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- DELETE trigger on Member 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/29 a_board ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from a_board
      where
        /*  a_board.id = :old.id */
        a_board.id = :old.id;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE Member because a_board exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/27 news ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from news
      where
        /*  news.id = :old.id */
        news.id = :old.id;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE Member because news exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/26 notice_board ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from notice_board
      where
        /*  notice_board.id = :old.id */
        notice_board.id = :old.id;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE Member because notice_board exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/23 q_board ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from q_board
      where
        /*  q_board.id = :old.id */
        q_board.id = :old.id;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE Member because q_board exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/18 finance_comment ON PARENT DELETE SET NULL */
    update finance_comment
      set
        /* finance_comment.id = NULL */
        finance_comment.id = NULL
      where
        /* finance_comment.id = :old.id */
        finance_comment.id = :old.id;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/16 comment ON PARENT DELETE SET NULL */
    update comment
      set
        /* comment.id = NULL */
        comment.id = NULL
      where
        /* comment.id = :old.id */
        comment.id = :old.id;

    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/8 board ON PARENT DELETE SET NULL */
    update board
      set
        /* board.id = NULL */
        board.id = NULL
      where
        /* board.id = :old.id */
        board.id = :old.id;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_Member after UPDATE on Member for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on Member 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/29 a_board ON PARENT UPDATE RESTRICT */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    select count(*) into numrows
      from a_board
      where
        /*  a_board.id = :old.id */
        a_board.id = :old.id;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE Member because a_board exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/27 news ON PARENT UPDATE RESTRICT */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    select count(*) into numrows
      from news
      where
        /*  news.id = :old.id */
        news.id = :old.id;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE Member because news exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/26 notice_board ON PARENT UPDATE RESTRICT */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    select count(*) into numrows
      from notice_board
      where
        /*  notice_board.id = :old.id */
        notice_board.id = :old.id;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE Member because notice_board exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/23 q_board ON PARENT UPDATE RESTRICT */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    select count(*) into numrows
      from q_board
      where
        /*  q_board.id = :old.id */
        q_board.id = :old.id;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE Member because q_board exists.'
      );
    end if;
  end if;

  /* Member R/18 finance_comment ON PARENT UPDATE SET NULL */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    update finance_comment
      set
        /* finance_comment.id = NULL */
        finance_comment.id = NULL
      where
        /* finance_comment.id = :old.id */
        finance_comment.id = :old.id;
  end if;

  /* Member R/16 comment ON PARENT UPDATE SET NULL */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    update comment
      set
        /* comment.id = NULL */
        comment.id = NULL
      where
        /* comment.id = :old.id */
        comment.id = :old.id;
  end if;

  /* Member R/8 board ON PARENT UPDATE SET NULL */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    update board
      set
        /* board.id = NULL */
        board.id = NULL
      where
        /* board.id = :old.id */
        board.id = :old.id;
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_news after INSERT on news for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on news 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/27 news ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from Member
      where
        /* :new.id = Member.id */
        :new.id = Member.id;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT news because Member does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_news after UPDATE on news for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on news 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/27 news ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from Member
    where
      /* :new.id = Member.id */
      :new.id = Member.id;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE news because Member does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_notice_board after INSERT on notice_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on notice_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/26 notice_board ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from Member
      where
        /* :new.id = Member.id */
        :new.id = Member.id;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT notice_board because Member does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_notice_board after UPDATE on notice_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on notice_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/26 notice_board ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from Member
    where
      /* :new.id = Member.id */
      :new.id = Member.id;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE notice_board because Member does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tD_q_board after DELETE on q_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- DELETE trigger on q_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* q_board R/30 a_board ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from a_board
      where
        /*  a_board.q_seq = :old.seq */
        a_board.q_seq = :old.seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE q_board because a_board exists.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tI_q_board after INSERT on q_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- INSERT trigger on q_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
    /* Member R/23 q_board ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from Member
      where
        /* :new.id = Member.id */
        :new.id = Member.id;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT q_board because Member does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

create trigger tU_q_board after UPDATE on q_board for each row
-- ERwin Builtin Thu Feb 18 13:36:45 2021
-- UPDATE trigger on q_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* q_board R/30 a_board ON PARENT UPDATE RESTRICT */
  if
    /* :old.seq <> :new.seq */
    :old.seq <> :new.seq
  then
    select count(*) into numrows
      from a_board
      where
        /*  a_board.q_seq = :old.seq */
        a_board.q_seq = :old.seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE q_board because a_board exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 13:36:45 2021 */
  /* Member R/23 q_board ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from Member
    where
      /* :new.id = Member.id */
      :new.id = Member.id;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE q_board because Member does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 13:36:45 2021
end;
/

