package com.movie.repository;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.BookVO;
import com.movie.domain.MovieVO;
import com.movie.domain.TheatherVO;

@Repository
public class BookDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {

		/*
		 * select * from book where bk_wDate < to_char(current_timestamp(), 'yyyy-mm-dd');
		 * 
		 * select * from book where mv_time <=date_format(now(), '%hh:%mm') and bk_wDate
		 * = to_char(current_timestamp(), 'yyyy-mm-dd');
		 */
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("book");

	}

	// 좌석 예약 여부 가져오기
	public List<TheatherVO> getTheatherSeatList(String tt_num, String bk_wDate, String mv_time, int mv_num) {

		String sql = "select * from theather where tt_num=?";
		String bookSql = "select * from book where mv_num=? and bk_wDate=? and mv_time=? and tt_num=?";
		List<TheatherVO> seatList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<TheatherVO>(TheatherVO.class),
				tt_num);
		List<BookVO> bookList = jdbcTemplate.query(bookSql, new BeanPropertyRowMapper<BookVO>(BookVO.class), mv_num,
				bk_wDate, mv_time, tt_num);

		for (int i = 0; i < seatList.size(); i++) {
			for (int j = 0; j < bookList.size(); j++) {
				if (seatList.get(i).getTt_seatNum().equals(bookList.get(j).getTt_seatNum())) {
					System.out.println(i + "은 예약되었음");
					seatList.get(i).setIsBooked("T");

				}

			}
			System.out.println("DAO" + seatList.get(i).getIsBooked());

		}

		return seatList;
	}

	// 예약 추가하기
	public void insertBook(BookVO bookVO) {
		String sql = "INSERT INTO book (mb_ID, mv_num, tt_num, tt_seatNum, bk_date, bk_wDate, mv_time, bk_price, bk_paid, mv_title) "
				+ "VALUES (?, ?, ?, ?, to_char(current_timestamp(), 'yyyy-mm-dd hh24:mi:ss'), ?, ?, ?, ?, ?); ";
		jdbcTemplate.update(sql, bookVO.getMb_ID(), bookVO.getMv_num(), bookVO.getTt_num(), bookVO.getTt_seatNum(),
				bookVO.getBk_wDate(), bookVO.getMv_time(), bookVO.getBk_price(), "T", bookVO.getMv_title());

	}

	// 선택 가능한 영화 타이틀 가져오기
	public List<MovieVO> getMovies(String title) {
		String sql = "select mv_time, mv_enddate from movie where mv_title=? and mv_isTrue='T' and mv_startDate <= to_char(current_timestamp, 'yyyy-mm-dd') and mv_endDate >= to_char(current_timestamp(), 'yyyy-mm-dd') group by mv_time, mv_enddate";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), title);
		return list;
	}

	// 선택 가능한 날짜 가져오기
	public List<MovieVO> getAbleDate(String mv_title, String mv_date) {
		String sql = "select mv_time from movie where mv_startDate <= ? and mv_endDate >= ? and mv_title =? and mv_isTrue='T' group by mv_time";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
				mv_date, mv_title);
		return list;
	}

	// 선택 가능한 상영관 가져오기
	public List<MovieVO> getAbleTheather(String mv_title, String mv_date, String mv_time) {
		String sql = "select * from movie where mv_startDate <= ? and mv_endDate >= ? and mv_title =? and mv_isTrue='T' and mv_time=?";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
				mv_date, mv_title, mv_time);
		return list;
	}

}
