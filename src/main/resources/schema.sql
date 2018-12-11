CREATE TABLE movie (
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