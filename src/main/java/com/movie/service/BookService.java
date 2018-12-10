package com.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.domain.BookVO;
import com.movie.domain.MemberVO;
import com.movie.domain.MovieVO;
import com.movie.domain.TheatherVO;
import com.movie.repository.BookDao;
import com.movie.repository.MemberDao;


@Service
@Transactional
public class BookService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BookDao bookDao;
	
	
	
	


	
}




