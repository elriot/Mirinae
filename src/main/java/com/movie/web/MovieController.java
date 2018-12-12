package com.movie.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.MovieVO;
import com.movie.repository.MovieDao;
import com.movie.util.MyUtils;

@Controller
@RequestMapping("movie")
public class MovieController {
	@Autowired
	private MovieDao movieDao;

	@RequestMapping("detail")
	public String detail(@RequestParam int mv_num, Model model) {
		System.out.println("mv_num : " + mv_num);
		
		MovieVO movieVO = movieDao.getMovieByMvTitle(mv_num);
		
		movieVO.setMv_trailer(MyUtils.getYoutubeParse(movieVO.getMv_trailer()));
		movieVO.setMv_detail(movieVO.getMv_detail().replace("\r\n", "<br>"));
		
		
		// 예약 가능여부 가져오기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 7일 후 날짜
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 7);		
		Date date = cal.getTime();
		
		String afterAWeek = sdf.format(date).toString();
		//System.out.println("영화상영시작일:" + movieVO.getMv_startDate() +"일주일 후" + afterAWeek);
		
		// 아직 영화 예매가 불가능함(일주일 이후에도 개봉하지 않음, 선택 가능한 날짜가 아님)
		int compare = afterAWeek.compareTo(movieVO.getMv_startDate());
		if(compare<0) { // 일주일 이내가 아님!
		    movieVO.setMv_isTrue("F");
		}
		System.out.println("movieVO mv_isTrue : " + movieVO.getMv_isTrue());
		
		model.addAttribute("movieVO", movieVO);
		
		return "movie/detail";
	}

	
	
}