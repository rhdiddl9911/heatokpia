CREATE TABLE a_board (
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       board_seq            INTEGER NOT NULL,
       id                   VARCHAR2(20) NOT NULL
);


ALTER TABLE a_board
       ADD  ( PRIMARY KEY (board_seq) ) ;


CREATE TABLE board (
       board_seq            INTEGER NOT NULL,
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
       title                VARCHAR2(100) NULL
);


ALTER TABLE board
       ADD  ( PRIMARY KEY (board_seq) ) ;


CREATE TABLE coment (
       coment_seq           INTEGER NOT NULL,
       board_seq            INTEGER NOT NULL,
       password             VARCHAR2(50) NULL,
       name                 VARCHAR2(20) NOT NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NULL,
       content              VARCHAR2(300) NOT NULL
);


ALTER TABLE coment
       ADD  ( PRIMARY KEY (coment_seq) ) ;


CREATE TABLE finance_coment (
       ip                   VARCHAR2(15) NOT NULL,
       seq                  INTEGER NOT NULL,
       content              VARCHAR2(300) NOT NULL,
       password             VARCHAR2(50) NULL,
       name                 VARCHAR2(20) NOT NULL,
       id                   VARCHAR2(20) NULL,
       createdate           DATE NOT NULL,
       finance_id           VARCHAR2(100) NOT NULL
);


ALTER TABLE finance_coment
       ADD  ( PRIMARY KEY (seq) ) ;


CREATE TABLE like (
       board_seq            INTEGER NOT NULL,
       ip                   VARCHAR2(15) NOT NULL
);


ALTER TABLE like
       ADD  ( PRIMARY KEY (board_seq) ) ;


CREATE TABLE Member (
       id                   VARCHAR2(20) NOT NULL,
       password             VARCHAR2(100) NOT NULL,
       email                VARCHAR2(100) NOT NULL,
       name                 VARCHAR2(20) NOT NULL,
       satus                VARCHAR2(1) NULL,
       role                 VARCHAR2(10) NULL
);


ALTER TABLE Member
       ADD  ( PRIMARY KEY (id) ) ;


CREATE TABLE news (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL,
       content              VARCHAR2(1000) NOT NULL,
       authorship           VARCHAR2(100) NULL,
       createdate           DATE NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
       url                  VARCHAR2(200) NULL
);


ALTER TABLE news
       ADD  ( PRIMARY KEY (seq) ) ;


CREATE TABLE notice_board (
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL,
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       updatedate           DATE NULL,
       hit                  INTEGER NULL,
       id                   VARCHAR2(20) NOT NULL
);


ALTER TABLE notice_board
       ADD  ( PRIMARY KEY (seq) ) ;


CREATE TABLE q_board (
       content              VARCHAR2(1000) NOT NULL,
       createdate           DATE NOT NULL,
       anser                VARCHAR2(1) NULL,
       id                   VARCHAR2(20) NOT NULL,
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(100) NOT NULL
);


ALTER TABLE q_board
       ADD  ( PRIMARY KEY (seq) ) ;


ALTER TABLE a_board
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES q_board ) ;


ALTER TABLE a_board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE board
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE coment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE coment
       ADD  ( FOREIGN KEY (board_seq)
                             REFERENCES board ) ;


ALTER TABLE finance_coment
       ADD  ( FOREIGN KEY (id)
                             REFERENCES Member ) ;


ALTER TABLE like
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
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on a_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* q_board R/30 a_board ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from q_board
      where
        /* :new.board_seq = q_board.seq */
        :new.board_seq = q_board.seq;
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

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_a_board after UPDATE on a_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on a_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* q_board R/30 a_board ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from q_board
    where
      /* :new.board_seq = q_board.seq */
      :new.board_seq = q_board.seq;
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

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tD_board after DELETE on board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- DELETE trigger on board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* board R/31 like ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from like
      where
        /*  like.board_seq = :old.board_seq */
        like.board_seq = :old.board_seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE board because like exists.'
      );
    end if;

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* board R/6 coment ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from coment
      where
        /*  coment.board_seq = :old.board_seq */
        coment.board_seq = :old.board_seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE board because coment exists.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_board after INSERT on board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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
        /* board.board_seq = :new.board_seq */
        board.board_seq = :new.board_seq;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_board after UPDATE on board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* board R/31 like ON PARENT UPDATE RESTRICT */
  if
    /* :old.board_seq <> :new.board_seq */
    :old.board_seq <> :new.board_seq
  then
    select count(*) into numrows
      from like
      where
        /*  like.board_seq = :old.board_seq */
        like.board_seq = :old.board_seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE board because like exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* board R/6 coment ON PARENT UPDATE RESTRICT */
  if
    /* :old.board_seq <> :new.board_seq */
    :old.board_seq <> :new.board_seq
  then
    select count(*) into numrows
      from coment
      where
        /*  coment.board_seq = :old.board_seq */
        coment.board_seq = :old.board_seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE board because coment exists.'
      );
    end if;
  end if;

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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
        /* board.board_seq = :new.board_seq */
        board.board_seq = :new.board_seq;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_coment after INSERT on coment for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on coment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/16 coment ON CHILD INSERT SET NULL */
    update coment
      set
        /* coment.id = NULL */
        coment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* coment.coment_seq = :new.coment_seq */
        coment.coment_seq = :new.coment_seq;

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* board R/6 coment ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from board
      where
        /* :new.board_seq = board.board_seq */
        :new.board_seq = board.board_seq;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT coment because board does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_coment after UPDATE on coment for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on coment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/16 coment ON CHILD UPDATE SET NULL */
    update coment
      set
        /* coment.id = NULL */
        coment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* coment.coment_seq = :new.coment_seq */
        coment.coment_seq = :new.coment_seq;

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* board R/6 coment ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from board
    where
      /* :new.board_seq = board.board_seq */
      :new.board_seq = board.board_seq;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE coment because board does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_finance_coment after INSERT on finance_coment for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on finance_coment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/18 finance_coment ON CHILD INSERT SET NULL */
    update finance_coment
      set
        /* finance_coment.id = NULL */
        finance_coment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* finance_coment.seq = :new.seq */
        finance_coment.seq = :new.seq;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_finance_coment after UPDATE on finance_coment for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on finance_coment 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/18 finance_coment ON CHILD UPDATE SET NULL */
    update finance_coment
      set
        /* finance_coment.id = NULL */
        finance_coment.id = NULL
      where
        not exists (
          select * from Member
            where
              /* :new.id = Member.id */
              :new.id = Member.id
        ) and
        /* finance_coment.seq = :new.seq */
        finance_coment.seq = :new.seq;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_like after INSERT on like for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on like 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* board R/31 like ON CHILD INSERT RESTRICT */
    select count(*) into numrows
      from board
      where
        /* :new.board_seq = board.board_seq */
        :new.board_seq = board.board_seq;
    if (
      /*  */
      
      numrows = 0
    )
    then
      raise_application_error(
        -20002,
        'Cannot INSERT like because board does not exist.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_like after UPDATE on like for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on like 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* board R/31 like ON CHILD UPDATE RESTRICT */
  select count(*) into numrows
    from board
    where
      /* :new.board_seq = board.board_seq */
      :new.board_seq = board.board_seq;
  if (
    /*  */
    
    numrows = 0
  )
  then
    raise_application_error(
      -20007,
      'Cannot UPDATE like because board does not exist.'
    );
  end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tD_Member after DELETE on Member for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- DELETE trigger on Member 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/18 finance_coment ON PARENT DELETE SET NULL */
    update finance_coment
      set
        /* finance_coment.id = NULL */
        finance_coment.id = NULL
      where
        /* finance_coment.id = :old.id */
        finance_coment.id = :old.id;

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/16 coment ON PARENT DELETE SET NULL */
    update coment
      set
        /* coment.id = NULL */
        coment.id = NULL
      where
        /* coment.id = :old.id */
        coment.id = :old.id;

    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* Member R/8 board ON PARENT DELETE SET NULL */
    update board
      set
        /* board.id = NULL */
        board.id = NULL
      where
        /* board.id = :old.id */
        board.id = :old.id;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_Member after UPDATE on Member for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on Member 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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

  /* Member R/18 finance_coment ON PARENT UPDATE SET NULL */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    update finance_coment
      set
        /* finance_coment.id = NULL */
        finance_coment.id = NULL
      where
        /* finance_coment.id = :old.id */
        finance_coment.id = :old.id;
  end if;

  /* Member R/16 coment ON PARENT UPDATE SET NULL */
  if
    /* :old.id <> :new.id */
    :old.id <> :new.id
  then
    update coment
      set
        /* coment.id = NULL */
        coment.id = NULL
      where
        /* coment.id = :old.id */
        coment.id = :old.id;
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_news after INSERT on news for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on news 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_news after UPDATE on news for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on news 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_notice_board after INSERT on notice_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on notice_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_notice_board after UPDATE on notice_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on notice_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tD_q_board after DELETE on q_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- DELETE trigger on q_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
    /* q_board R/30 a_board ON PARENT DELETE RESTRICT */
    select count(*) into numrows
      from a_board
      where
        /*  a_board.board_seq = :old.seq */
        a_board.board_seq = :old.seq;
    if (numrows > 0)
    then
      raise_application_error(
        -20001,
        'Cannot DELETE q_board because a_board exists.'
      );
    end if;


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tI_q_board after INSERT on q_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- INSERT trigger on q_board 
declare numrows INTEGER;
begin
    /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

create trigger tU_q_board after UPDATE on q_board for each row
-- ERwin Builtin Thu Feb 18 10:47:20 2021
-- UPDATE trigger on q_board 
declare numrows INTEGER;
begin
  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
  /* q_board R/30 a_board ON PARENT UPDATE RESTRICT */
  if
    /* :old.seq <> :new.seq */
    :old.seq <> :new.seq
  then
    select count(*) into numrows
      from a_board
      where
        /*  a_board.board_seq = :old.seq */
        a_board.board_seq = :old.seq;
    if (numrows > 0)
    then 
      raise_application_error(
        -20005,
        'Cannot UPDATE q_board because a_board exists.'
      );
    end if;
  end if;

  /* ERwin Builtin Thu Feb 18 10:47:20 2021 */
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


-- ERwin Builtin Thu Feb 18 10:47:20 2021
end;
/

