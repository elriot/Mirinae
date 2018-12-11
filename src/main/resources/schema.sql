create table if not exists movie (
mv_num integer primary key,
mv_title varchar(100),
mv_rating varchar(20),
mv_detail varchar(1000),
mv_releasedate varchar(20),
mv_postimage varchar(50),
mv_trailer varchar(100),
tt_num integer,
mv_startdate varchar(20),
mv_enddate varchar(20),
mv_time varchar(20),
mv_istrue varchar(10) default 'T'
);