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
      from board_comment
      where
        /*  comment.board_seq = :old.seq */
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
    update board_comment
      set
        /* comment.id = NULL */
        board_comment.id = NULL
      where
        /* board_comment.id = :old.id */
        board_comment.id = :old.id;

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
    update board_comment
      set
        /* board_comment.id = NULL */
        board_comment.id = NULL
      where
        /* board_comment.id = :old.id */
        board_comment.id = :old.id;
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
