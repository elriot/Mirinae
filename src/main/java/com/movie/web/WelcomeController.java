package com.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.domain.MovieVO;
import com.movie.repository.MovieDao;

@Controller
public class WelcomeController {
	@Autowired
	private MovieDao movieDao;

	@RequestMapping("/")
	public String welcome(Model model) {
//		List<MovieVO> list = movieDao.getMoviesForMainPage();
//		for (MovieVO vo : list) {
//		//	System.out.println(vo.toString());
//		}
//		
//		model.addAttribute("list", list);
		return "index/index";
	}
	

}
