package com.movie.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.BookVO;
import com.movie.domain.CsVO;
import com.movie.domain.MemberVO;
import com.movie.repository.CsDao;
import com.movie.repository.MemberDao;
import com.movie.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CsDao csDao;


	// http://localhost:8999/moive/member/add
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		
		return "member/joinForm";
		
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute MemberVO memberVO) {
		// Member 오브젝트 생성 후 파라미터 채워서 전달해줌
		// 회원가입날짜
		System.out.println("ddddddddddd");
		memberVO.setMb_joinDate(new Timestamp(System.currentTimeMillis()).toString());
		
		
		memberService.add(memberVO);
		System.out.println("memberVO : "+ memberVO.getMb_ID());

		return "redirect:/";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/loginForm";
	}

	// 1210 수정
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, Model model,
			HttpServletResponse response, HttpSession session) throws Exception {
		int check = memberService.userCheck(memberVO.getMb_ID(), memberVO.getMb_passwd());

		if (check != MemberService.ID_AND_PASSWD_OK) {
			// 아이디, 패스워드 모두 일치하지 않으면
			String message = "";
			switch (check) {
				case MemberService.ONLY_PASSWD_FAIL:
					message = "패스워드 틀림";
					break;
				case MemberService.ID_AND_PASSWD_FAIL:
					message = "아이디 없음";
					break;
			}

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("history.back();");
			out.println("</script>");
			out.close(); // out.flush() 먼저 수행하고 자원닫기
			return null;
		}
		
		//model.addAttribute("memberVO", memberVO);
		session.setAttribute("mb_ID", memberVO.getMb_ID());
		System.out.println("mb_ID : " + memberVO.getMb_ID());
		System.out.println("mb_passwd : " + memberVO.getMb_passwd());
		
		// 쿠키
		Cookie cookie = new Cookie("mb_ID", memberVO.getMb_ID());
		cookie.setMaxAge(60*60*24*7); // 초 단위  60초*60*24*7 -> 1주일
		cookie.setPath("/");
		
		response.addCookie(cookie);
		
		return "redirect:/";
	}

	@RequestMapping("main")
	public String main(HttpSession session) {
		String id = (String) session.getAttribute("mb_ID");
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {
			return "redirect:/";
		}
		
		return "redirect:/";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String mb_ID= (String) session.getAttribute("mb_ID");
		System.out.println(mb_ID + "님 로그아웃함ㅋ");
		session.invalidate();
		
		Cookie[] cookies=request.getCookies();
		if (cookies != null) {
			for (Cookie c:cookies) {
				if (c.getName().equals("mb_ID")) {
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
				}
			}
		}
		

		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃');");
			out.println("location.href='/movie/'");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();			
		}
		
		//session.removeAttribute(mb_ID);
		return null;
//		return "redirect:/";
	}
	
	
	@RequestMapping("myPage") // 멤버객체, 예약정보
	public String myInfo(HttpSession session, Model model) {
		// 1. 멤버VO 가져오기
		String id = (String) session.getAttribute("mb_ID");
		MemberVO memberVO = memberService.get(id);
		
		
		// 2. 예약정보 가져오기
		// 1) 내 아이디로 가져오기, 2) 영화정보 가져오기, 3) 좌석정보 가져오기
		List<BookVO> bkList = memberService.getBookListByMbIDGroupByMvNum(memberVO.getMb_ID());

/*		List<BookVO> seatList = null;		
		Map<Integer, List<BookVO>> map = new HashMap<>(); 
		for (int i=0; i<bkList.size(); i++) {
			BookVO bookVO = bkList.get(i);

			seatList = memberService.getSeatNumByMbIDAndMvNum(bookVO.getMb_ID(), bookVO.getMv_num());
			map.put(bookVO.getMv_num(), seatList);
			for(int j=0; j<seatList.size(); j++) {
				BookVO vo = seatList.get(j);
			}		 
		}

		List<BookVO> stList = new ArrayList<>();
		for(int i=0; i<bkList.size(); i++) {
			BookVO bookVO = bkList.get(i);
			stList = map.get(bookVO.getMv_num());
			
			// 예약 취소 가능여부  설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm", Locale.KOREA);

			
			String todayDate = sdf.format(System.currentTimeMillis());
			String currentTime = sdf2.format(System.currentTimeMillis());
			
			String wDate = bookVO.getBk_wDate();
			String mvTime = bookVO.getMv_time();
			
			
			String strToday = todayDate + " " + currentTime;
			String strMovieWatchDay = wDate + " " + mvTime;
			
			System.out.println("현재날짜+시간 : " + strToday +" "+", 영화시간 : " + strMovieWatchDay);
			
			int compare = strToday.compareTo(strMovieWatchDay);
			
			if(compare>=0) {
				System.out.println("상영이 시작되거나 종료됨");
				bookVO.setBk_paid("noRefund");
	
			}
			//System.out.println(bookVO.getMv_num()+","+bookVO.getBk_paid());
		}*/
		
		
		
		// 위 까지 안전한 코드
		// 오늘 시간을 기준으로 지난 날짜는 예약취소 불가능하게..		
		
		// 위 까지 안전한 코드
		// 오늘 시간을 기준으로 지난 날짜는 예약취소 불가능하게..		
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("bkList", bkList);
//		model.addAttribute("map", map);
		
		
		
		// 20181207 이인혁 추가
		List<CsVO> myCsList = memberDao.getMyCsList(id);
		model.addAttribute("myCsList", myCsList);
		return "member/myPage";
	}

	@RequestMapping("get")
	public String get(HttpSession session, Model model) {
		String id = (String) session.getAttribute("mb_ID");
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {
			return "redirect:/member/login";
		}

		MemberVO memberVO = memberService.get(id);
		System.out.println("get : " + memberVO.toString());
		// model.addAttribute("member", member);
		model.addAttribute(memberVO);

		return "member/info";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(HttpSession session, @ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws Exception {
		String id = (String) session.getAttribute("mb_ID");
		//System.out.println("세션" + id);
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {
			System.out.println("세션이 없단다");
			return "redirect:/movie/";
		}
		
		System.out.println(memberVO.toString());

		int check = memberService.userCheck(memberVO.getMb_ID(), memberVO.getMb_passwd());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(check);
		if (check == MemberService.ONLY_PASSWD_FAIL) {

			out.println("<script>");
			out.println("alert('패스워드 틀림');");
			out.println("location.href='/movie/member/myPage';");
			out.println("</script>");
			out.close(); // out.flush() 먼저 수행하고 자원닫기
			

		} else {
			
			memberService.update(memberVO);
			out.println("<script>");
			out.println("alert('수정 성공');");	
			out.println("location.href='/movie/member/myPage';");
			out.println("</script>");
			out.close();

		}
		
		
		return null;

	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(HttpSession session) {
		String id = (String) session.getAttribute("mb_ID");
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {
			return "redirect:/member/login";
		}
		return "member/delete";
	}

	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(HttpSession session, @RequestParam String mb_passwd, HttpServletResponse response) throws Exception {
		String id = (String) session.getAttribute("mb_ID");
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {
			return "redirect:/member/login";
		}
		
		int check = memberService.userCheck(id, mb_passwd);
		
		if (check == MemberService.ONLY_PASSWD_FAIL) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('패스워드틀림');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
		}
		
		memberService.delete(id);
		session.invalidate();  // 세션값 초기화(전체 삭제)
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('회원 삭제되었습니다.');");
        out.println("location.href='/movie/'");
        out.println("</script>");
        out.close();
        return null;
	}
	
	@RequestMapping(value = "searchId")
	public String searchId() {
		System.out.println("searchId 까지");
		return "/member/searchIdForm";
	}
	
	@RequestMapping(value = "emailChk", method = RequestMethod.POST)
	public String emailChk(@ModelAttribute MemberVO memberVO, HttpServletResponse response) // Model 메서드를써야 el식 쓸수있음 폼에서
			throws Exception {

		String id = memberService.emailCheck(memberVO.getMb_email());
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('회원님의 아이디는 " + id +"입니다.');");
        out.println("location.href='/movie/'");
        out.println("</script>");
        out.close();
        return null;

	}
	
	@RequestMapping(value = "searchPwd")
	public String searchPwd(@ModelAttribute MemberVO memberVO) {
		String id = memberVO.getMb_ID();
		System.out.println("searchPwd id 담겼나? :" + id);
		return "/member/searchPasswdForm";
	}
	
	@RequestMapping(value = "searchIdPasswdForm")
	public String searchIdPasswdForm() {
		return "/member/searchIdPasswdForm";
	}
	
	
	// 예약 취소하기
	@RequestMapping(value = "bookCancel", method = RequestMethod.POST)
	public String bookCancel(@ModelAttribute BookVO bookVO, HttpServletResponse response, HttpSession session) 
			throws Exception {
		String mb_ID = (String) session.getAttribute("mb_ID");
		bookVO.setMb_ID(mb_ID);

		System.out.println(bookVO.toString());
		
		memberService.deleteBookByMbIDAndMvNum(mb_ID, bookVO.getMv_num());		
		
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('예약 취소 되었습니다.');");
        out.println("location.href='/movie/member/myPage'");
        out.println("</script>");
        out.close();
        
        return null;

	}
	
	// 이인혁 20181206
	@RequestMapping(value="write")
	public String writeForm() {
		return "/member/memberCsWrite";
	}
	
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String write(CsVO csVO, HttpServletRequest reqeust, HttpServletResponse response){
		HttpSession session = reqeust.getSession();
		
		String id = (String)session.getAttribute("mb_ID");
		
		csVO.setId(id);
		csVO.setReg_date(new Timestamp(System.currentTimeMillis()).toString());
		csVO.setReply("F");
		csDao.writeCs(csVO);
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록되었습니다.'); location.href='myPage';</script>");
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping(value="csDelete", method=RequestMethod.POST)
	public String csDelete(@RequestParam(value="check", required=false) int num[], HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
	    
	    if(num==null) {
            out = response.getWriter();
            out.println("<script>alert('삭제할 글이 선택되지 않았습니다.'); location.href=history.back();</script>");
            out.close();
	    } else {
	        for(int i = 0; i < num.length; i++) {
	            csDao.deleteCs(num[i]);
	        }
            out = response.getWriter();
            out.println("<script>alert('문의글이 삭제되었습니다.'); location.href='myPage';</script>");
            out.close();
	    }


		
		return null;
	}
	
	@RequestMapping(value="memberCsDetail")
	public String getDetail(@RequestParam int num, Model model) {
		CsVO csVO = csDao.getCsVO(num);
		
		model.addAttribute("csVO",csVO);
		return "/member/csDetail";
	}
	//------- 이인혁 20181206 업데이트 끝
	
	
	
/*	
	//테스트용
	@RequestMapping(value = "searchPwd")
	public String searchPwd() {
		return "/member/searchPasswdForm";
	}*/

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	
	
