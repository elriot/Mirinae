package com.movie.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.movie.domain.BookVO;
import com.movie.domain.MemberVO;
import com.movie.domain.MovieVO;
import com.movie.domain.TheatherVO;
import com.movie.repository.BookDao;
import com.movie.repository.MovieDao;
import com.movie.service.MemberService;

@Controller
@RequestMapping("book")
public class BookController {

	@Autowired
	private BookDao bookDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private MemberService MemberService;
	
	// 좌석 정보 뷰 테스트용 http://localhost:9000/movie/book/selectSeatTest
	@RequestMapping("selectSeatTest")
	public String selectSeatTest() {
		return "book/selectSeatTest";
	}

	// 예약 1) 영화 제목 선택하기
	@RequestMapping("selectMovie")
	public String selectMovie(Model model, @RequestParam(value="mv_title", required=false)
		String mv_title) {

		
	
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = new GregorianCalendar();
		
		// 오늘날짜
		Date date = cal.getTime();
		String min = sdf.format(date).toString();
		
		// 7일 후 날짜
		cal.add(Calendar.DATE, 7);
		date = cal.getTime();
		String max = sdf.format(date).toString();
		
		System.out.println(min +","+ max);
		model.addAttribute("min", min);
		model.addAttribute("max", max);		
		
		
		// 상영중인 모든 영화 가져오기
		List<MovieVO> list = movieDao.getMovieTitle(max);		
		model.addAttribute("list", list);	
		
		//디테일에서 제목 클릭시 예매창 이동할 때 가져갈 제목 값
		model.addAttribute("mv_title", mv_title);
					
		return "book/selectMovie";
	}
	
	
	// 예약 2) 영화 관람일 선택하기
	@RequestMapping(value="selectDate", method=RequestMethod.POST)
	public String selectDate(@RequestParam("mv_title") String mv_title, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = new GregorianCalendar();
		
		// 오늘날짜
		Date date = cal.getTime();
		String min = sdf.format(date).toString();
		
		// 7일 후 날짜
		cal.add(Calendar.DATE, 7);
		Date dateAfterAWeek = cal.getTime();
		String max = sdf.format(dateAfterAWeek).toString();
		
		//System.out.println("오늘 날짜는: "+ today +", 일주일 뒤에는 : "+ afterAWeek);
		
		
		
		// 영화이름으로 상영종료일 가져오기
		MovieVO movieVO = movieDao.getMovieByTitle(mv_title);
				
		// 영화 상영종료 날짜가 현재일+7 보다 빠르면 max값을 영화 상영 종료 날짜로 변경하기
		try {
			String strMovieStartDate = movieVO.getMv_startDate();
			String strMovieEndDate = movieVO.getMv_endDate();
			//System.out.println("영화 상영 종료일 : " + strMovieEndDate);
			Date movieEndDate = sdf.parse(strMovieEndDate);
			int compare = dateAfterAWeek.compareTo(movieEndDate);
			// 영화 상영종료 날짜가  일주일 뒤의 날짜보다 빠르면
			if (compare > 0) {
				// max값을 상영종료일로 변경함
				max = strMovieEndDate;
				//System.out.println("일주일 뒤의 날짜보다 상영 종료일이 더 빠릅니다.");
			}
			
			// 영화 상영시작일이 오늘보다 늦으면 캘린더 min 값을 상영 시작일로 변경함
			int compareStartDate = min.compareTo(strMovieStartDate);
			if(compareStartDate < 0) {
				min = strMovieStartDate;
			}

		} catch (ParseException e) {
			e.printStackTrace();

		}

		model.addAttribute("min", min);
		model.addAttribute("max", max);		
		model.addAttribute("mv_title", mv_title);
						
		return "book/selectDate";
	}
	
	
	
	// 예약 3) 영화 시간 선택하기
	@RequestMapping(value="selectTime", method=RequestMethod.POST)
	public String selectTime(@RequestParam("mv_title") String mv_title, @RequestParam("bk_wDate") 
	String bk_wDate, Model model, HttpServletResponse response) {
	
		List<MovieVO> list = movieDao.getMovieListByTime(mv_title);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm", Locale.KOREA);

		String systemTime = sdf.format(System.currentTimeMillis());
		String wDate = bk_wDate;
		System.out.println(systemTime+"," +wDate);
		int compare = systemTime.compareTo(wDate);
		int check=0;
		if(compare==0) {
			//System.out.println("상영일과 오늘이 같음");
			String now = sdf2.format(System.currentTimeMillis());
			for(int i =0; i <list.size(); i++) {
				MovieVO vo = list.get(i);
				String mvTime = vo.getMv_time();
				int compareTime = now.compareTo(mvTime);
				
				// 현재 시간과 영화 상영시간을 비교.
				// 1: 리턴. 상영이 이미 시작됨 -> 리스트에서 삭제
				if(compareTime>0) {
					list.remove(i);
				}
			}			
		}	
		
		// 만약 리스트 사이즈가 0이면 (현재 시간을 기준으로 오늘 해당영화의 상영이 종료되었으면)
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        if (list.size()==0) {

    		try {
    			out = response.getWriter();
                out.println("<script>");
                out.println("alert('금일 해당 영화의 상영이 종료되었습니다.날짜를 다시 선택해 주세요');");
                out.println("history.back();");
                out.println("</script>");
                out.close();
                return null;
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
        }

		
		
		model.addAttribute("bk_wDate", bk_wDate);		
		model.addAttribute("mv_title", mv_title);
		
		model.addAttribute("list", list);
						
		return "book/selectTime";
	}
	
	// 예약 4) 상영관 선택하기.
	@RequestMapping(value="selectTtnum", method=RequestMethod.POST)
	public String selectTtnum(@ModelAttribute MovieVO movieVO, @RequestParam("bk_wDate") String bk_wDate, HttpServletRequest request,Model model) {
		List<MovieVO> list = movieDao.getMovieListByTtnum(movieVO.getMv_title(), movieVO.getMv_time());
		
		
		model.addAttribute("mv_title", movieVO.getMv_title());
		model.addAttribute("mv_time", movieVO.getMv_time());
		model.addAttribute("bk_wDate", bk_wDate);		
		model.addAttribute("list", list);
						
		return "book/selectTtnum";
	}
	
	
	// 예약5) 좌석 선택하기
	@RequestMapping(value="selectSeat", method=RequestMethod.POST)
	public String selectSeat(@ModelAttribute BookVO book, @RequestParam("mv_title") String mv_title, Model model) {
		// 1) mv_num 가져오기
		MovieVO movieVO = movieDao.getMovieMvnum(mv_title, book.getMv_time(), book.getTt_num());
		
		// 2) 상영관  가져오기 (예약 여부 T/F값으로 입력됨)
		List<TheatherVO>list = bookDao.getTheatherSeatList(book.getTt_num(), book.getBk_wDate(), book.getMv_time(), movieVO.getMv_num());
		
		for(TheatherVO vo : list) {
			System.out.println(vo.getIsBooked());
			if(vo.getIsBooked()==null) {
				vo.setIsBooked("F");
				System.out.println(vo.getIsBooked());

			}
			System.out.println(vo.toString());
		}
			
		model.addAttribute("mv_num", movieVO.getMv_num());
		model.addAttribute("mv_title", mv_title);
		model.addAttribute("list", list);
		model.addAttribute(book);

		return "book/selectSeat";
	}
	
	// 예약6) 결제화면 뷰
	@RequestMapping(value="payment", method=RequestMethod.POST)
	public String payment(@RequestParam("tt_seatNum") String[] str, @RequestParam("mv_title") String mv_title, 
			HttpServletRequest request, Model model, @ModelAttribute BookVO book, @ModelAttribute MovieVO movieVO, HttpSession session) {
/*			@RequestParam("mv_num") String mv_num , @RequestParam("tt_num") String tt_num, 
			@RequestParam("bk_wDate") String bk_wDate, @RequestParam("mv_time") String mv_time) {
*/
		
		//String mb_ID = (String)session.getAttribute("mb_ID");
		List<BookVO>list = new ArrayList<>();		
		for (int i=0; i<str.length; i++) {
			String tt_seatNum = str[i];
			BookVO bookVO = new BookVO();

			bookVO.setMv_num(book.getMv_num());
			bookVO.setTt_num(book.getTt_num());
			bookVO.setBk_wDate(book.getBk_wDate());
			bookVO.setMv_time(book.getMv_time());
			bookVO.setTt_seatNum(tt_seatNum);
			//bookVO.setMb_ID(mb_ID);
			bookVO.setBk_price(10000);
			//mv_num=null, tt_num=1, tt_seatNum=null, bk_date=null, bk_wDate=2018-12-03, mv_time=16:00, bk_price=30000, bk_paid=null
			list.add(bookVO);			
		}
		

		model.addAttribute("mv_title", mv_title);
		model.addAttribute("list", list);
		model.addAttribute("seat_str", str);
		model.addAttribute("listSize", list.size());
		

		return "book/payment";
	}
	
	
	// 예약7) 결제하기
	@RequestMapping(value = "complete", method = RequestMethod.POST)
	public String complete(@RequestParam("tt_seatNum") String[] tt_seatNum, HttpServletRequest request,
			@ModelAttribute BookVO bookVO, Model model, HttpServletResponse response,  HttpSession session) {
		
		String mb_ID = (String)session.getAttribute("mb_ID");
		//MemberVO memberVO = MemberService.get(mb_ID);
		for(int i=0; i<tt_seatNum.length; i++) {
			// 세션값 확인하여 아이디 값 세팅해야함
			bookVO.setMb_ID(mb_ID);
			bookVO.setTt_seatNum(tt_seatNum[i]);;
			bookVO.setBk_price(10000);
			System.out.println(bookVO.toString());
			bookDao.insertBook(bookVO);
		}	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;

		try {
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약 완료되었습니다. 마이페이지에서 확인하세요');");
			out.println("location.href='/movie';");
			out.println("</script>");
			out.close();
			return null;
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
		
		return null;
		

	}
	
	
	@RequestMapping(value="getAbleDate", method=RequestMethod.GET)
	public @ResponseBody String getDates(@RequestParam String title) {
		List<MovieVO> list = bookDao.getMovies(title);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@RequestMapping(value="getAbleTime", method=RequestMethod.GET)
	public @ResponseBody String getTimes(@RequestParam String title, @RequestParam String date){
		System.out.println(date);
		List<MovieVO> list = bookDao.getAbleDate(title, date);		
		Gson gson = new Gson();
		return gson.toJson(list);
		//return null;
	}
	
	@RequestMapping(value="getAbleTheather", method=RequestMethod.GET)
	public @ResponseBody String getTimes(@RequestParam String title, @RequestParam String date, @RequestParam String time){
		List<MovieVO> list = bookDao.getAbleTheather(title, date, time);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	
}
