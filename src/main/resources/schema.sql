CREATE TABLE IF NOT EXISTS book (
  bk_num integer PRIMARY KEY,
  mb_ID varchar(20),
  mv_num integer,
  tt_num varchar(20),
  tt_seatNum varchar(20),
  bk_date varchar(20),
  bk_wDate varchar(20),
  mv_time varchar(20),
  bk_price integer,
  bk_paid varchar(20),
  mv_title varchar(50)
);


CREATE TABLE IF NOT EXISTS cs (
  num integer PRIMARY KEY,
  cs_type varchar(20),
  id varchar(30),
  title varchar(50),
  content varchar(4000),
  reply_content varchar(4000),
  reg_date varchar(50),
  reply varchar(10),
  reply_date varchar(30)
);


CREATE TABLE IF NOT EXISTS member (
  mb_num integer PRIMARY KEY,
  mb_ID varchar(20),
  mb_passwd varchar(20),
  mb_name varchar(20),
  mb_email varchar(50),
  mb_phone varchar(20),
  mb_grade varchar(20),
  mb_point integer,
  mb_joinDate varchar(50)
);


CREATE TABLE IF NOT EXISTS movie (
  mv_num integer PRIMARY KEY,
  mv_title varchar(100),
  mv_rating varchar(20),
  mv_detail varchar(1000),
  mv_releaseDate varchar(20),
  mv_postImage varchar(50),
  mv_trailer varchar(100),
  tt_num integer,
  mv_startDate varchar(20),
  mv_endDate varchar(20),
  mv_time varchar(20),
  mv_isTrue varchar(10) DEFAULT 'T'
);


CREATE TABLE IF NOT EXISTS notice (
  nt_num integer PRIMARY KEY,
  nt_subject varchar(200),
  nt_content varchar(10000),
  nt_writeDate varchar(50),
  nt_writeIP varchar(50),
  nt_readCount integer
);


CREATE TABLE IF NOT EXISTS theather (
  tt_num varchar(20),
  tt_seatNum varchar(20) 
);