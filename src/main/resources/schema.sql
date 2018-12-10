CREATE TABLE IF NOT EXISTS `book` (
  `bk_num` int(11) NOT NULL AUTO_INCREMENT,
  `mb_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_num` int(11) DEFAULT NULL,
  `tt_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tt_seatNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bk_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bk_wDate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bk_price` int(11) DEFAULT NULL,
  `bk_paid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bk_num`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `cs` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `cs_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_date` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `member` (
  `mb_num` int(11) NOT NULL AUTO_INCREMENT,
  `mb_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_passwd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_grade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_point` int(11) DEFAULT NULL,
  `mb_joinDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mb_num`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `movie` (
  `mv_num` int(11) NOT NULL AUTO_INCREMENT,
  `mv_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_rating` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_detail` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_releaseDate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_postImage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_trailer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tt_num` int(11) DEFAULT NULL,
  `mv_startDate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_endDate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mv_isTrue` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'T',
  PRIMARY KEY (`mv_num`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `notice` (
  `nt_num` int(11) NOT NULL AUTO_INCREMENT,
  `nt_subject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nt_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `nt_writeDate` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nt_writeIP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nt_readCount` int(11) NOT NULL,
  PRIMARY KEY (`nt_num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `theather` (
  `tt_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tt_seatNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

