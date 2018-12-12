package com.movie.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.BookVO;
import com.movie.domain.CsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.MovieVO;

@Repository
public class AdminDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;;

	
	public void insertMv(MovieVO movie) {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("movie").usingGeneratedKeyColumns("mv_num");
		movie.setMv_isTrue("T");
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(movie));
	}
	
	// 현재 등록된 영화의 최대 mv_num 찾기, 영화 등록시 해당영화의 파일업로드 경로 설정을 위해 필요
		public Integer getMaxMvnum() {
			String sql = "select max(mv_num) from movie";
			Integer max = jdbcTemplate.queryForObject(sql, Integer.class);
			return max;
		}
	
	// 모든 멤버 가져오기 - 지우면 안됨
	public List<MemberVO> getAll(){
		List<MemberVO> list = jdbcTemplate.query
				("SELECT * FROM member ORDER BY mb_num ASC", 
						new BeanPropertyRowMapper<MemberVO>(MemberVO.class));				
		return list;
	}
	
	//상영 마감 하기 -----------------
	public void screenCancel(String title) {
		String sql = "update movie set mv_isTrue = 'F' where mv_title = ?";
		jdbcTemplate.update(sql, title);
	}
	
	// 김수빈 매출 확인하기 20181206 추가
	public List<BookVO> getBookListForSales(String bk_date) {
		String sql = "select * from book where bk_date like ? order by mv_title asc";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<BookVO>(BookVO.class), "%"+bk_date+"%");
	}
	
	// 이인혁 20181206 추가
	public List<CsVO> getAllCs(){
		List<CsVO> list = jdbcTemplate.query
				("SELECT * FROM cs ORDER BY num desc", 
						new BeanPropertyRowMapper<CsVO>(CsVO.class));				
		return list;
	}
	
	// 전치용 20181207 추가
	// 오늘 예매율
	public List<List<Object>> dayBookTotal() {
		String sql = "select mv_title, count(*) cnt from book where DATE(bk_wDate) = DATE(current_timestamp(), 'yyyy-mm-dd') group by mv_title";
		//jdbcTemplate.query("select mv_title, count(*) from book where DATE(bk_wDate) = DATE(now()) group by mv_title", 
				//new BeanPropertyRowMapper<Map<String, Integer>>(Map.class));
		//대충 요리해서 쓰도록.
		List<List<Object>> list = jdbcTemplate.query(sql, new RowMapper<List<Object>>() {

			@Override
			public List<Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
				List<Object> list = new ArrayList<>();
				list.add(rs.getString("mv_title"));
				list.add(rs.getInt("cnt"));
				return list;
			}
			
		});
		return list;
	}
	
	
	// 이인혁 20181207 추가
	public void updateReply(int num, String reply_content) {
		
		Timestamp time = new Timestamp(System.currentTimeMillis());
		String date = time.toString();
		String sql = "update cs set reply_content = ?,reply_date = ?,reply = 'T' where num = ?";
		jdbcTemplate.update(sql, reply_content, date, num); 
	}
	
	
	// 이인혁 20181206 추가
	public List<CsVO> getAllCs(int startRow, int pageSize){
		System.out.println("getAllCs");
		String sql ="SELECT * FROM cs ORDER BY num DESC offset ? limit ?";
		List<CsVO> list = jdbcTemplate.query
				(sql, new BeanPropertyRowMapper<CsVO>(CsVO.class),startRow -1,pageSize);				
		return list;
	}
	
	
}
