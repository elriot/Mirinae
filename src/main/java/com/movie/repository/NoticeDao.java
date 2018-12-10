package com.movie.repository;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.NoticeVO;

@Repository
public class NoticeDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	private SimpleJdbcInsert simpleJdbcInsert;
	
	@PostConstruct
	public void init() {
		simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("notice");
	}
	
	public int count() {
		int count = jdbcTemplate.queryForObject("SELECT count(*) FROM notice", Integer.class);
		return count;
	} // 글 갯수 확인
	
	public void insert(NoticeVO noticeVO) {
		simpleJdbcInsert.execute(new BeanPropertySqlParameterSource(noticeVO));
	}
	
	public NoticeVO getNotice(int num) {
		NoticeVO noticeVO = jdbcTemplate.queryForObject("SELECT * FROM notice WHERE nt_num = ?", 
				new BeanPropertyRowMapper<NoticeVO>(NoticeVO.class), num);
		return noticeVO;
	}
	
	public List<NoticeVO> getNoticeList(int startRow) {
		List<NoticeVO> list = jdbcTemplate.query("SELECT * FROM notice ORDER BY nt_num desc limit ?, 5", 
				new BeanPropertyRowMapper<NoticeVO>(NoticeVO.class), startRow - 1);
		return list;
	}
	
	public int getNoticeMaxNum() {
		int maxNum = jdbcTemplate.queryForObject("SELECT max(nt_num) FROM notice", Integer.class);
		return maxNum;
	}
	
	public void updateNoticeReadcount(int num) {
		jdbcTemplate.update("UPDATE notice SET nt_readCount = nt_readCount + 1 WHERE nt_num = ?",  num);
	}
	
	public int updateNotice(NoticeVO noticeVO) {
		int rowCount = namedParameterJdbcTemplate.update("UPDATE notice SET nt_subject = :nt_subject, nt_content = :nt_content WHERE nt_num = :nt_num", 
				new BeanPropertySqlParameterSource(noticeVO));
		return rowCount;
	}
	
	public void deleteNotice(int num) {
		jdbcTemplate.update("DELETE FROM notice WHERE nt_num = ?", num);
	}
}