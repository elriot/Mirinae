package com.movie.repository;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.CsVO;

@Repository // 자동으로 읽어주는 에노테이션 ex)컨트롤러, 서비스
public class CsDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert simpleJdbcInsert;
	
	@PostConstruct	// 읽어올때 자동으로 호출되게 해줄거거든
	private void init(){
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("cs"); //
		
	}

	public void writeCs(CsVO csVO) {
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(csVO));
	}
	
	public List<CsVO> getCsList(String id, int startRow){
		String sql = "SELECT * FROM cs WHERE id=? ORDER BY num DESC offset ? limit 5";
			
		List<CsVO>list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CsVO>(CsVO.class),id,startRow);
		
		return list;
	}
	
	public void deleteCs(int num) {
		String sql = "DELETE FROM cs WHERE num = ?";
		
		jdbcTemplate.update(sql, num);
	}
	
	public CsVO getCsVO(int num) {
		String sql = "SELECT * FROM cs WHERE num = ?";
		
		CsVO csVO = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CsVO>(CsVO.class),num);
		return csVO;
	}
	
	
	public int getCsCount() {
		String sql="SELECT COUNT(*) FROM cs";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	} // 글 갯수 확인
	
}
