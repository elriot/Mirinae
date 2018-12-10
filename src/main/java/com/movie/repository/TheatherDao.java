package com.movie.repository;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.movie.domain.TheatherVO;


@Repository
public class TheatherDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	private SimpleJdbcInsert simpleJdbcInsert;
	
	@PostConstruct
	public void init() {

	}
	
	// 상영관 정보 가져오기
	public List<TheatherVO> getTtNumList() {
		List<TheatherVO> list = jdbcTemplate.query("select tt_num from theather group by tt_num", 
				new BeanPropertyRowMapper<TheatherVO>(TheatherVO.class));
		return list;
	}
	

}
