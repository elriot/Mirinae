package com.movie.api;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.movie.repository.AdminDao;

@RestController
@RequestMapping("api/admin")
public class AdminRestController {
	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping("charts")
	public List<List<Object>> dayBookTotal() {
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = new GregorianCalendar();
		Date date = cal.getTime();
		
		String day = sdf.format(date).toString();
		System.out.println(day);
		model.addAttribute("day", day);*/
		
		List<List<Object>> list = adminDao.dayBookTotal();
		
		List<Object> titleList = Arrays.asList("제목", "숫자");
		list.add(0, titleList);
		
		return list;
	}
}