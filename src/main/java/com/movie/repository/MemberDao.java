package com.movie.repository;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.BookVO;
import com.movie.domain.CsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.MovieVO;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;

	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("member").usingGeneratedKeyColumns("mb_num"); // 필수
		jdbcTemplate.execute("insert into member (mb_ID, mb_passwd, mb_name, mb_email, mb_phone, mb_grade, mb_point, mb_joinDate) values ('admin', '1234', '관리자', 'admin@admin.ccc', '000', 'master', 99999999, '2018-01-01 10:54:38.021')");
		// 기본키 이면서 AUTO_INCREMENT 컬럼이름 설정
		// simpleJdbcInsert.usingGeneratedKeyColumns("");
	}

	public void add(MemberVO memberVO) {
		// NamedParameterJdbcTemplate 방식
		/*
		 * SqlParameterSource param = new BeanPropertySqlParameterSource(member); String
		 * sql = "INSERT INTO member (id,passwd,name,reg_date,age,gender,email) " +
		 * "VALUES (:id, :passwd, :name, :reg_date, :age, :gender, :email)";
		 * namedParameterJdbcTemplate.update(sql, param);
		 */

		// SimpleJdbcInsert 방식
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(memberVO));
	} // add()

	public int update(MemberVO memberVO) {
		int rowCount = 
				namedParameterJdbcTemplate.update(
				"UPDATE member SET mb_name=:mb_name, mb_email=:mb_email, mb_phone=:mb_phone WHERE mb_ID=:mb_ID",
				new BeanPropertySqlParameterSource(memberVO));
		return rowCount;
	}

	
/*	 public int update(Member member) {
	      int rowCount = namedParameterJdbcTemplate.update
	            ("UPDATE member SET name=:name, age=:age,"
	                  + " gender=:gender, email=:email WHERE id=:id",
	            new BeanPropertySqlParameterSource(member));
	      // 업데이트 된 행의 개수를 리턴
	      return rowCount;   
	   }   */
	public void delete(String id) {
		// JdbcTemplate 방식
		// jdbcTemplate.update("DELETE FROM member WHERE id=?", id);

		// NamedParameterJdbcTemplate 방식
		SqlParameterSource param = new MapSqlParameterSource("mb_ID", id);
		namedParameterJdbcTemplate.update("DELETE FROM member WHERE mb_ID=:mb_ID", param);
	} // delete()

	public int deleteAll() {
		return jdbcTemplate.update("DELETE FROM member");
	}
	
	public MemberVO getId(String email) {
		try {
			// JdbcTemplate 방식
			
/*			 * Member m = jdbcTemplate.queryForObject("SELECT * FROM member WHERE id=?", new
			 * BeanPropertyRowMapper<Member>(Member.class), id); return m;*/
			 

			// NamedParameterJdbcTemplate 방식
			MemberVO mm= jdbcTemplate.queryForObject("SELECT * FROM member WHERE mb_email=?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), email);
			System.out.println("name memberVo : " + mm.toString());
			return mm;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
/*	public List<MemberVO> getId(String email) {
		try {
			// JdbcTemplate 방식
			
			 * Member m = jdbcTemplate.queryForObject("SELECT * FROM member WHERE id=?", new
			 * BeanPropertyRowMapper<Member>(Member.class), id); return m;
			 

			// NamedParameterJdbcTemplate 방식
			List<MemberVO> mm= jdbcTemplate.queryForObject("SELECT mb_ID FROM member WHERE mb_email=?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), email);
			System.out.println("name ///memberVo : " + mm);
			return mm;
			
			List<MemberVO> list = jdbcTemplate.query("SELECT * FROM member WHERE mb_email=?", new BeanPropertyRowMapper<MemberVO>(MemberVO.class), email);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/

	public MemberVO get(String mb_ID) {
		// queryForObject() 메소드는 행 1개만 가져오는 select문 실행시 사용함.
		// 행이 0개 또는 2개 이상 가져오면 예외가 발생함.
		try {
			MemberVO m;
			try {
				m = jdbcTemplate.queryForObject("SELECT * FROM member WHERE mb_ID=?", new BeanPropertyRowMapper<MemberVO>(MemberVO.class), mb_ID);
			} catch (Exception e) {

				e.printStackTrace();
				return null;
			}

			return m;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	} // get()

	public List<MemberVO> getAll() {
		// 행이 0개 또는 0개 이상일때 query() 메소드 호출
		// 항상 List로 반환해줌
		List<MemberVO> list = jdbcTemplate.query("SELECT * FROM member ORDER BY mb_name ASC",
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
		return list;
	}

	public List<MemberVO> search(String name) {
		List<MemberVO> list = jdbcTemplate.query("SELECT * FROM member WHERE mb_name LIKE ?", new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
				"%" + name + "%");
		return list;
	}
	
	public int count() {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member", Integer.class);
		return count;
	}
	
	public int countById(String id) {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE mb_ID = ?", Integer.class, id);
		return count;
	}
	
	public int countByEmail(String email) {
		int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM member WHERE mb_email = ?", Integer.class, email);
		System.out.println("MemberDao.countByEmail return:"+count);
		return count;
	}
	
	public MemberVO getPwd(String passwd) {
		try {// NamedParameterJdbcTemplate 방식
			MemberVO mm= jdbcTemplate.queryForObject("SELECT mb_passwd FROM member WHERE mb_ID=?",
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), passwd);
			System.out.println("PASWDD memberVo : " + mm.toString());
			
			return mm;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	// 예약하면 +200포인트 
	public void plusPoint(MemberVO memberVO) {				
		namedParameterJdbcTemplate.update(
				"UPDATE member SET mb_point=:mb_point+200 WHERE mb_ID=:mb_ID",
				new BeanPropertySqlParameterSource(memberVO));
	}
	
	// 예약취소하면 -200 포인트 차감
	public void MinusPoint(MemberVO memberVO) {		
		namedParameterJdbcTemplate.update(
				"UPDATE member SET mb_point=:mb_point-200 WHERE mb_ID=:mb_ID",
				new BeanPropertySqlParameterSource(memberVO));
	}
	
	
	
		
	
	
	
	
	
	// 나의 예약정보 가져오기 1. 내 아이디로 가져오기 (mv_num별)
	public List<BookVO> getBookListByMbIDGroupByMvNum(String mb_ID){
		return jdbcTemplate.query("SELECT distinct mv_num FROM book WHERE mb_ID=? order by mv_num asc ", new BeanPropertyRowMapper<BookVO>(BookVO.class), mb_ID);
	}
	
	// 나의 예약정보 가져오기 2. mv_nu으로 영화 타이틀 가져오기
	public MovieVO getMovieByMvNum(Integer mv_num){
		return jdbcTemplate.queryForObject("SELECT * FROM movie WHERE mv_num=? order by bk_date asc", new BeanPropertyRowMapper<MovieVO>(MovieVO.class), mv_num);
	}
	
	// 나의 예약정보 가져오기 3. 예약한 영화 별 좌석정보 가져오기
	public List<BookVO> getSeatNumByMbIDAndMvNum(String mb_id, Integer mv_num){
		return jdbcTemplate.query("select * from book where mb_ID=? and mv_num=? order by tt_seatNum asc", new BeanPropertyRowMapper<BookVO>(BookVO.class), mb_id, mv_num);	
	}
	
	// 나의 예약정보 가져오기4. 내 아이디로만(그룹별)
	public List<BookVO> getBookListByMbID(String mb_ID){
		return jdbcTemplate.query("SELECT * FROM book WHERE mb_ID=? order by bk_date asc", new BeanPropertyRowMapper<BookVO>(BookVO.class), mb_ID);
	}
	
	
	// 나의 예약정보 삭제하기. 
	public void deleteBookByMbIDAndMvNum(String mb_ID, Integer mv_num){
		jdbcTemplate.update("delete from book where mb_ID=? and mv_num=?", mb_ID, mv_num);
	}
	
	
	// 20181207 이인혁 추가
	public List<CsVO> getMyCsList(String id){
		String sql = "SELECT * FROM cs where id=? ORDER BY num DESC";
	List<CsVO> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CsVO>(CsVO.class),id);
	
		return list;
	}





	

}
