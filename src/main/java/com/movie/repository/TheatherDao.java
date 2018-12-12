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
		jdbcTemplate.execute("insert into theather values ('1', 'A01')");
		jdbcTemplate.execute("insert into theather values ('1', 'A02')");
		jdbcTemplate.execute("insert into theather values ('1', 'A03')");
		jdbcTemplate.execute("insert into theather values ('1', 'A04')");
		jdbcTemplate.execute("insert into theather values ('1', 'A05')");
		jdbcTemplate.execute("insert into theather values ('1', 'A06')");
		jdbcTemplate.execute("insert into theather values ('1', 'A07')");
		jdbcTemplate.execute("insert into theather values ('1', 'A08')");
		jdbcTemplate.execute("insert into theather values ('1', 'A09')");
		jdbcTemplate.execute("insert into theather values ('1', 'A10')");
		jdbcTemplate.execute("insert into theather values ('1', 'B01')");
		jdbcTemplate.execute("insert into theather values ('1', 'B02')");
		jdbcTemplate.execute("insert into theather values ('1', 'B03')");
		jdbcTemplate.execute("insert into theather values ('1', 'B04')");
		jdbcTemplate.execute("insert into theather values ('1', 'B05')");
		jdbcTemplate.execute("insert into theather values ('1', 'B06')");
		jdbcTemplate.execute("insert into theather values ('1', 'B07')");
		jdbcTemplate.execute("insert into theather values ('1', 'B08')");
		jdbcTemplate.execute("insert into theather values ('1', 'B09')");
		jdbcTemplate.execute("insert into theather values ('1', 'B10')");
		jdbcTemplate.execute("insert into theather values ('1', 'C01')");
		jdbcTemplate.execute("insert into theather values ('1', 'C02')");
		jdbcTemplate.execute("insert into theather values ('1', 'C03')");
		jdbcTemplate.execute("insert into theather values ('1', 'C04')");
		jdbcTemplate.execute("insert into theather values ('1', 'C05')");
		jdbcTemplate.execute("insert into theather values ('1', 'C06')");
		jdbcTemplate.execute("insert into theather values ('1', 'C07')");
		jdbcTemplate.execute("insert into theather values ('1', 'C08')");
		jdbcTemplate.execute("insert into theather values ('1', 'C09')");
		jdbcTemplate.execute("insert into theather values ('1', 'C10')");
		jdbcTemplate.execute("insert into theather values ('2', 'A01')");
		jdbcTemplate.execute("insert into theather values ('2', 'A02')");
		jdbcTemplate.execute("insert into theather values ('2', 'A03')");
		jdbcTemplate.execute("insert into theather values ('2', 'A04')");
		jdbcTemplate.execute("insert into theather values ('2', 'A05')");
		jdbcTemplate.execute("insert into theather values ('2', 'A06')");
		jdbcTemplate.execute("insert into theather values ('2', 'A07')");
		jdbcTemplate.execute("insert into theather values ('2', 'A08')");
		jdbcTemplate.execute("insert into theather values ('2', 'A09')");
		jdbcTemplate.execute("insert into theather values ('2', 'A10')");
		jdbcTemplate.execute("insert into theather values ('2', 'B01')");
		jdbcTemplate.execute("insert into theather values ('2', 'B02')");
		jdbcTemplate.execute("insert into theather values ('2', 'B03')");
		jdbcTemplate.execute("insert into theather values ('2', 'B04')");
		jdbcTemplate.execute("insert into theather values ('2', 'B05')");
		jdbcTemplate.execute("insert into theather values ('2', 'B06')");
		jdbcTemplate.execute("insert into theather values ('2', 'B07')");
		jdbcTemplate.execute("insert into theather values ('2', 'B08')");
		jdbcTemplate.execute("insert into theather values ('2', 'B09')");
		jdbcTemplate.execute("insert into theather values ('2', 'B10')");
		jdbcTemplate.execute("insert into theather values ('2', 'C01')");
		jdbcTemplate.execute("insert into theather values ('2', 'C02')");
		jdbcTemplate.execute("insert into theather values ('2', 'C03')");
		jdbcTemplate.execute("insert into theather values ('2', 'C04')");
		jdbcTemplate.execute("insert into theather values ('2', 'C05')");
		jdbcTemplate.execute("insert into theather values ('2', 'C06')");
		jdbcTemplate.execute("insert into theather values ('2', 'C07')");
		jdbcTemplate.execute("insert into theather values ('2', 'C08')");
		jdbcTemplate.execute("insert into theather values ('2', 'C09')");
		jdbcTemplate.execute("insert into theather values ('2', 'C10')");
		jdbcTemplate.execute("insert into theather values ('3', 'A01')");
		jdbcTemplate.execute("insert into theather values ('3', 'A02')");
		jdbcTemplate.execute("insert into theather values ('3', 'A03')");
		jdbcTemplate.execute("insert into theather values ('3', 'A04')");
		jdbcTemplate.execute("insert into theather values ('3', 'A05')");
		jdbcTemplate.execute("insert into theather values ('3', 'A06')");
		jdbcTemplate.execute("insert into theather values ('3', 'A07')");
		jdbcTemplate.execute("insert into theather values ('3', 'A08')");
		jdbcTemplate.execute("insert into theather values ('3', 'A09')");
		jdbcTemplate.execute("insert into theather values ('3', 'A10')");
		jdbcTemplate.execute("insert into theather values ('3', 'B01')");
		jdbcTemplate.execute("insert into theather values ('3', 'B02')");
		jdbcTemplate.execute("insert into theather values ('3', 'B03')");
		jdbcTemplate.execute("insert into theather values ('3', 'B04')");
		jdbcTemplate.execute("insert into theather values ('3', 'B05')");
		jdbcTemplate.execute("insert into theather values ('3', 'B06')");
		jdbcTemplate.execute("insert into theather values ('3', 'B07')");
		jdbcTemplate.execute("insert into theather values ('3', 'B08')");
		jdbcTemplate.execute("insert into theather values ('3', 'B09')");
		jdbcTemplate.execute("insert into theather values ('3', 'B10')");
		jdbcTemplate.execute("insert into theather values ('3', 'C01')");
		jdbcTemplate.execute("insert into theather values ('3', 'C02')");
		jdbcTemplate.execute("insert into theather values ('3', 'C03')");
		jdbcTemplate.execute("insert into theather values ('3', 'C04')");
		jdbcTemplate.execute("insert into theather values ('3', 'C05')");
		jdbcTemplate.execute("insert into theather values ('3', 'C06')");
		jdbcTemplate.execute("insert into theather values ('3', 'C07')");
		jdbcTemplate.execute("insert into theather values ('3', 'C08')");
		jdbcTemplate.execute("insert into theather values ('3', 'C09')");
		jdbcTemplate.execute("insert into theather values ('3', 'C10')");


		

	}
	
	// 상영관 정보 가져오기
	public List<TheatherVO> getTtNumList() {
		List<TheatherVO> list = jdbcTemplate.query("select tt_num from theather group by tt_num", 
				new BeanPropertyRowMapper<TheatherVO>(TheatherVO.class));
		return list;
	}
	

}
