package com.movie.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.movie.domain.MovieVO;
import com.movie.repository.MovieDao;

@RestController
@RequestMapping("api/movie")
public class MovieRestController {
	@Autowired
	private MovieDao movieDao;
	
	// http://localhost:8080/app/api/member/list
	@RequestMapping("listByTitle")
	public List<MovieVO> list(@RequestParam String mv_title) {
		List<MovieVO> list = movieDao.getMovieListByTitle(mv_title);
		return list;
	}
	
//	// http://localhost:8080/app/api/member/chkDupId
//	@RequestMapping("chkDupId")
//	public Map<String, Integer> checkDuplicatId(@RequestParam String id) {
//		int count = memberService.countById(id);
//		
//		Map<String, Integer> map = new HashMap<>();
//		map.put("count", count);
//		
//		return map;
//	}
//	
	
}






