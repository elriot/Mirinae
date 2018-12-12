package com.movie.repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

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
public class ScheduleDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;
	
	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("movie").usingGeneratedKeyColumns("mv_num");;
		
		
//		Timer timer = new Timer();
//		TimerTask timerTask = new TimerTask() {
//			
//			@Override
//			public void run() {
//				// movie 테이블에 현재날짜와 상영종료날짜 비교해서 지난 레코드는 mv_isTrue를 F로 수정
//				jdbcTemplate.update("update movie set mv_isTrue='F' where mv_endDate < to_char(current_timestamp, 'yyyy-mm-dd')");
//				
//				//System.out.println("5초에 한번씩 작동함 :");
//			}
//		};
//		timer.scheduleAtFixedRate(timerTask, 0, 1000*60*60*24); // 24시간에 한번씩
		//timer.scheduleAtFixedRate(timerTask, 0, 5000); // 5초에 한번씩
	}
	
	// 상영중 영화 모두 가져오기
//	public List<MovieVO> getMovieTitle() {
//		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_isTrue='T' group by mv_title",
//				new BeanPropertyRowMapper<MovieVO>(MovieVO.class));
//		return list;
//	}
	

	// 영화 타이틀 별로 가져오기 (영화 제목을 선택하세요)
//	public List<MovieVO> getMovieListByTitle(String mv_title) {
//		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=?",
//				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
//		return list;
//	}
	

	// 상영 시작, 종료일 확인하여 캘린더 min, max값 조정하기
//	public MovieVO getMovieByTitle(String mv_title) {
//		MovieVO movieVO = jdbcTemplate.queryForObject("select * from movie where mv_title=? group by mv_title",
//				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
//		return movieVO;
//	}
	
	
	// 선택한 영화 타이틀의 상영시간 가져오기
//	public List<MovieVO> getMovieListByTime(String mv_title) {
//		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=? group by mv_time",
//				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
//		return list;
//	}
	
	// 선택한 시간의 상영관 정보 가져오기
//	public List<MovieVO> getMovieListByTtnum(String mv_title, String mv_time) {
//		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=? and mv_time=?",
//				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title, mv_time);
//		return list;
//	}	
	
	
	// 선택한 모든 정보로 mv_num(기본키) 찾기 
	public MovieVO getMovieMvnum(String mv_title, String mv_time, Integer tt_num) {
		MovieVO movieVO = jdbcTemplate.queryForObject("select * from movie where mv_title=? and mv_time=? and tt_num=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title, mv_time, tt_num);
		return movieVO;
	}
	
	// 좌석 예약 여부 가져오기
//		public List<TheatherVO> getTheatherSeatList(String tt_num, String bk_wDate, String mv_time, int mv_num) {
//
//			String sql = "select * from theather where tt_num=?" ;
//			String bookSql = "select * from book where mv_num=? and bk_wDate=? and mv_time=? and tt_num=?";
//			List<TheatherVO> seatList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<TheatherVO>(TheatherVO.class), tt_num);
//			List<BookVO>bookList = jdbcTemplate.query(bookSql, new BeanPropertyRowMapper<BookVO>(BookVO.class), mv_num, bk_wDate, mv_time, tt_num);
//
//			for(int i=0;i<seatList.size();i++) {
//				for(int j=0;j<bookList.size();j++) {
//					if(seatList.get(i).getTt_seatNum().equals(bookList.get(j).getTt_seatNum())) {
//						System.out.println(i+"은 예약되었음");
//						seatList.get(i).setIsBooked("T");					
//					} 
//				}
//				System.out.println("DAO" + seatList.get(i).getIsBooked());
//			}	
//			return seatList;
//		}
		
		// 예약 추가하기
//		public void insertBook(BookVO bookVO) {
//			String sql = "INSERT INTO book (mb_ID, mv_num, tt_num, tt_seatNum, bk_date, bk_wDate, mv_time, bk_price, bk_paid, mv_title) "
//					+ "VALUES (?, ?, ?, ?, current_timestamp, ?, ?, ?, ?, ?); ";
//			jdbcTemplate.update(sql, bookVO.getMb_ID(), bookVO.getMv_num(), bookVO.getTt_num(),
//					bookVO.getTt_seatNum(), bookVO.getBk_wDate(), bookVO.getMv_time(), bookVO.getBk_price(), "T", bookVO.getMv_title());
//
//		}

	// 선택 가능한 영화 타이틀 가져오기
//	public List<MovieVO> getMovies(String title) {
//		String sql = "select * from movie where mv_title=? and mv_isTrue='T' and mv_endDate >= to_char(current_timestamp, 'yyyy-mm-dd') group by mv_time";
//		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), title);
//		return list;
//	}

	// 선택 가능한 시간 가져오기
//	public List<MovieVO> getAbleDate(String mv_title, String mv_date) {
//		String sql = "select * from movie where mv_endDate >= ? and mv_title =? and mv_isTrue='T' group by mv_time";
//		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
//				mv_title);
//		return list;
//	}

	// 선택 가능한 상영관 가져오기
	public List<MovieVO> getAbleTheather(String mv_title, String mv_date, String mv_time) {
		String sql = "select * from movie where mv_endDate >= ? and mv_title =? and mv_isTrue='T' and mv_time=?";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
				mv_title, mv_time);
		return list;
	}
	
	
	// 나의예약정보 ------- mvNum으로 영화정보 가져오기
	public MovieVO getMovieByMvNum(String mv_num) {
		MovieVO movieVO = jdbcTemplate.queryForObject("select * from movie where mv_num=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_num);
		return movieVO;
	}	
	
	// 오픈중인 영화
	public List<MovieVO> getOpenMovie() {
		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_isTrue='T' order by mv_time asc;",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class));
		return list;
	}
		
	// 오늘 시간표 가져오기
		
	public List<MovieVO> getScheduleMovie(String pickDate) {
		String sql = "select * " + 
				"from movie " + 
				"where mv_startDate <= ? "+ 
				"and mv_endDate >= ? and mv_isTrue='T' order by mv_title asc;";
		List<MovieVO> list = jdbcTemplate.query(sql,
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class),pickDate, pickDate);
		return list;
	}
	
	
	
}
