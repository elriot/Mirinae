package com.movie.repository;

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

import com.movie.domain.MovieVO;


@Repository
public class MovieDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;
	
	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("movie").usingGeneratedKeyColumns("mv_num");
		
		
		Timer timer = new Timer();
		TimerTask timerTask = new TimerTask() {
			
			@Override
			public void run() {
				// movie 테이블에 현재날짜와 상영종료날짜 비교해서 지난 레코드는 mv_isTrue를 F로 수정
				int count = count();
				if (count > 0) {
					updateMovieTrue();
				}
//				jdbcTemplate.execute("INSERT INTO movie (mv_title, mv_rating, mv_detail, mv_releaseDate, mv_postImage, mv_trailer, tt_num, mv_startDate, mv_endDate, mv_time, mv_isTrue) VALUES ('국가부도의 날', '12세', '모든 투자자들은 한국을 떠나라. 지금 당장 1997년, 대한민국 최고의 경제 호황을 믿어 의심치 않았던 그때,   곧 엄청난 경제 위기가 닥칠 것을 예견한 한국은행 통화정책팀장 ‘한시현’(김혜수)은 이 사실을 보고하고,   정부는 뒤늦게 국가부도 사태를 막기 위한 비공개 대책팀을 꾸린다.       한편, 곳곳에서 감지되는 위기의 시그널을 포착하고 과감히 사표를 던진 금융맨 ‘윤정학’(유아인)은   국가부도의 위기에 투자하는 역베팅을 결심, 투자자들을 모으기 시작한다.   이런 상황을 알 리 없는 작은 공장의 사장이자 평범한 가장 ‘갑수’(허준호)는   대형 백화점과의 어음 거래 계약서에 도장을 찍고 소박한 행복을 꿈꾼다. 국가부도까지 남은 시간 단 일주일. 대책팀 내부에서 위기대응 방식을 두고 시현과 ‘재정국 차관’(조우진)이 강하게 대립하는 가운데, 시현의 반대에도 불구하고 ‘IMF 총재’(뱅상 카셀)가 협상을 위해 비밀리에 입국하는데… 위기를 막으려는 사람과 위기에 베팅하는 사람, 그리고 회사와 가족을 지키려는 평범한 사람, 1997년, 서로 다른 선택을 했던 사람들의 이야기가 시작된다!', '2018-11-28', 'all.png', 'https://www.youtube.com/watch?v=XIWN4Ui9XQ4', 1, "
//						+ "'2018-11-28', '2018-12-31', '10:00', 'T')");
				//System.out.println("5초에 한번씩 작동함 :");
			}
		};
		timer.scheduleAtFixedRate(timerTask, 0, 1000*60*60*24); // 1000*60*60*24 : 24시간에 한번씩
		//timer.scheduleAtFixedRate(timerTask, 0, 5000); // 5초에 한번씩
	}
	
	public void updateMovieTrue() {
		jdbcTemplate.update("update movie set mv_isTrue='F' where mv_endDate < to_char(current_timestamp(), 'yyyy-mm-dd')");
	}
	
	// 상영중 영화 모두 가져오기 max num- 예약페이지
	public List<MovieVO> getMovieTitle(String max) { 
		List<MovieVO> list = jdbcTemplate.query("select mv_title, mv_rating, mv_detail, mv_releasedate, mv_postimage, mv_trailer from movie where mv_isTrue='T' and mv_startDate <= ? group by mv_title",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), max);
		return list;
	}
	
	// 영화 상영 취소용
	public List<MovieVO> getMovieTitle() {
		List<MovieVO> list = jdbcTemplate.query("select mv_title, mv_rating, mv_detail, mv_releasedate, mv_postimage, mv_trailer from movie where mv_isTrue='T' and mv_startDate <= to_char(current_timestamp(), 'yyyy-mm-dd') group by mv_title",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class));
		return list;
	}
	

	// 영화 타이틀 별로 가져오기 (영화 제목을 선택하세요)
	public List<MovieVO> getMovieListByTitle(String mv_title) {
		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
		return list;
	}
	

	// 상영 시작, 종료일 확인하여 캘린더 min, max값 조정하기
	public MovieVO getMovieByTitle(String mv_title) {
		MovieVO movieVO = jdbcTemplate.queryForObject("select * from movie where mv_title=? group by mv_title",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
		return movieVO;
	}
	
	
	// 선택한 영화 타이틀의 상영시간 가져오기
	public List<MovieVO> getMovieListByTime(String mv_title) {
		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=? group by mv_time",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title);
		return list;
	}
	
	// 선택한 시간의 상영관 정보 가져오기
	public List<MovieVO> getMovieListByTtnum(String mv_title, String mv_time) {
		List<MovieVO> list = jdbcTemplate.query("select * from movie where mv_title=? and mv_time=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title, mv_time);
		return list;
	}	
	
	
	// 선택한 모든 정보로 mv_num(기본키) 찾기 
	public MovieVO getMovieMvnum(String mv_title, String mv_time, String tt_num) {
		MovieVO movieVO = jdbcTemplate.queryForObject("select * from movie where mv_title=? and mv_time=? and tt_num=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_title, mv_time, tt_num);
		return movieVO;
	}

	// 선택 가능한 영화 타이틀 가져오기
	public List<MovieVO> getMovies(String title) {
		String sql = "select mv_title, mv_rating, mv_detail, mv_releasedate, mv_postimage, mv_trailer from movie where mv_title=? and mv_isTrue='T' and mv_endDate >= to_char(current_timestamp(), 'yyyy-mm-dd') group by mv_time";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), title);
		return list;
	}

	// 선택 가능한 시간 가져오기
	public List<MovieVO> getAbleDate(String mv_title, String mv_date) {
		String sql = "select mv_title, mv_rating, mv_detail, mv_releasedate, mv_postimage, mv_trailer from movie where mv_endDate >= to_char(current_timestamp(), 'yyyy-mm-dd') and mv_title =? and mv_isTrue='T' group by mv_time";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
				mv_title);
		return list;
	}

	// 선택 가능한 상영관 가져오기
	public List<MovieVO> getAbleTheather(String mv_title, String mv_date, String mv_time) {
		String sql = "select * from movie where mv_endDate >= to_char(current_timestamp(), 'yyyy-mm-dd') and mv_title =? and mv_isTrue='T' and mv_time=?";
		List<MovieVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_date,
				mv_title, mv_time);
		return list;
	}
	
	
	// 나의예약정보 ------- mvNum으로 영화정보 가져오기
	public MovieVO getMovieByMvTitle(int mv_num) {
		MovieVO movieVO = jdbcTemplate.queryForObject("select mv_title, mv_rating, mv_detail, mv_releaseDate, mv_startDate, mv_endDate, mv_postImage, mv_trailer, mv_isTrue from movie where mv_num=?",
				new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_num);
		return movieVO;
	}	
	
	
	// 메인에 출력될 영화 리스트 (mv_isTrue="T" 모두 가져오기) 
	public List<MovieVO>getMoviesForMainPage() {
		List<MovieVO> list = jdbcTemplate.query("select min(mv_num) mv_num, mv_title, mv_rating, mv_detail, mv_releasedate, mv_postimage, mv_trailer from movie where mv_isTrue='T' group by mv_title order by mv_releasedate"
				, new BeanPropertyRowMapper<MovieVO>(MovieVO.class));
		return list;
	}
	
	public int count() {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM movie", Integer.class);
		return count;
	}
	
}
