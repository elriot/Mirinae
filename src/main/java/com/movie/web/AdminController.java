package com.movie.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movie.domain.BookVO;
import com.movie.domain.CsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.MovieVO;
import com.movie.domain.NoticeVO;
import com.movie.domain.PageVO;
import com.movie.domain.TheatherVO;
import com.movie.repository.AdminDao;
import com.movie.repository.CsDao;
import com.movie.repository.MovieDao;
import com.movie.repository.TheatherDao;
import com.movie.service.NoticeService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private TheatherDao theatherDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private CsDao csDao;
	@Autowired
    private NoticeService noticeService;
	
	@RequestMapping("main")
	public String main() {

		return "admin/main";
	}
	
	@RequestMapping(value="screenCancel", method=RequestMethod.GET)
	public String screenCancel(Model model) {
		List<MovieVO> list = movieDao.getMovieTitle();
		
		model.addAttribute("mList", list);
		return "admin/screenCancel";
	}
	
    @RequestMapping(value = "screenCancel", method = RequestMethod.POST)
    public String screenCancel(@RequestParam String title, HttpServletResponse response) {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        adminDao.screenCancel(title);
        try {
            out = response.getWriter();
            out.println("<script>");
            out.println("alert('["+title+"]의 상영이 마감되었습니다.');");
            out.println("location.href='/movie/admin/screenCancel'");
            out.println("</script>");
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        
        return null;
    }
	
/*	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(@ModelAttribute RegisterVO mvo, HttpServletRequest request) {
		String[] ttNum = request.getParameterValues("tt_num");
			mvo.setTt_num(ttNum[0]);
		adminDao.insertRg(mvo);
		return "redirect:/";
	}*/
	
	// 영화 등록 페이지로 이동하기
	@RequestMapping(value="movie", method=RequestMethod.GET)
	public String movie(Model model) {
		List<TheatherVO> list = theatherDao.getTtNumList();
		model.addAttribute("list", list);
		for(TheatherVO t : list) {
			System.out.println(t.getTt_num()+","+t.getTt_seatNum());
			
		}
		return "admin/movie"; 
	}
	
	
	// 영화 & 상영정보 등록하기
	@RequestMapping(value="movie", method=RequestMethod.POST)
	public String movie(HttpServletRequest request, 
			@ModelAttribute MovieVO mv, 
			@RequestParam("image") MultipartFile multi
			) throws Exception {
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/upload");
		String filename = null;
		filename = multi.getOriginalFilename();
		
		String[] tt_nums = request.getParameterValues("tt_num");
		String[] mv_times = request.getParameterValues("mv_time");
		
		//int directory = (((maxMvNum+1)/100)+1)*100;
		
		if(tt_nums.length == 1 && mv_times.length == 1) {


			//File dic = new File(realPath+"/"+directory+"/"+(maxMvNum+1));
			//if(!dic.exists()) {
				//dic.mkdirs();
			//}
			File file = new File(realPath, filename);
			IOUtils.copy(multi.getInputStream(), new FileOutputStream(file));
			mv.setMv_postImage(filename);
			adminDao.insertMv(mv);
		} else {
			for(int i=0; i<tt_nums.length; i++) {
				mv.setTt_num(Integer.parseInt(tt_nums[i]));
				for(int j=0; j<mv_times.length; j++) {
					mv.setMv_time(mv_times[j]);
					//int maxMvNum = adminDao.getMaxMvnum();
					//int directory = (((maxMvNum+1)/100)+1)*100;
					//File dic = new File(realPath+"/upload""+(maxMvNum+1));
//					if(!dic.exists()) {
//						dic.mkdirs();
//					}
					File file = new File(realPath, filename);
					IOUtils.copy(multi.getInputStream(), new FileOutputStream(file));
					mv.setMv_postImage(filename);
					adminDao.insertMv(mv);
				}

			}
		}
		
		return "redirect:/admin/main";
	}
	
	
	@RequestMapping("list") 
	public String list(Model model) {
		List<MemberVO> list = adminDao.getAll();
		model.addAttribute("list", list); // 객체만 들어감.


		return "admin/list";
	}
	
	
	// 김수빈 20181206 시작
	// 매출확인일 선택 뷰
	@RequestMapping("sales") 
	public String sales(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		
		// 오늘날짜		
		String max = sdf.format(System.currentTimeMillis());
		
		model.addAttribute("max", max);		
		
		return "admin/sales";
	}	
	
	// 매출을 출력하는 뷰
	@RequestMapping(value="salesByDate", method=RequestMethod.POST) 
	public String salesByDate(@RequestParam("bk_date")String bk_date, @RequestParam("max") String max, Model model) {
		List<BookVO> list = adminDao.getBookListForSales(bk_date);
		
		model.addAttribute("list", list);
		model.addAttribute("bk_date", bk_date);  
		model.addAttribute("max", max);
		
		return "admin/salesByDate";
	}
	// 김수빈 20181206 끝
	
	

	// 이인혁 20181206 시작   
	   @RequestMapping("cs")
	   public String getCsList(@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, Model model) {
		  
		  
		  // 전체 총 글갯수 메서드를 호출해서 인트값에 넣음
		  int count = csDao.getCsCount();
		  // 보여줄 글갯수
		  int pageSize = 3;
		  // 보여줄 페이지 첫번째 글번호
		  int startRow = (pageNum -1) * pageSize +1;
		  // 제네릭 보드bean 객체타입에 담을 dao의 getallscs 메서드 호출
		  List<CsVO> list = adminDao.getAllCs(startRow, pageSize);
		  // 밑에나오는 페이지블록수 정하기 연산 총글갯수 나누기 한페이지에 보여줄 글갯수
		  int pageCount = count / pageSize + (count%pageSize == 0? 0: 1);
		  int pageBlock = 2;
		  int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1: 0)) * pageBlock +1;
		  int endPage = startPage+pageBlock -1;
		  if(endPage > pageCount) {
			  endPage = pageCount;
		  }
		  
		  PageVO pageVO = new PageVO();
		  pageVO.setCount(count);
		  pageVO.setPageNum(pageNum);
		  pageVO.setPageCount(pageCount);
		  pageVO.setPageBlock(pageBlock);
		  pageVO.setStartPage(startPage);
		  pageVO.setEndPage(endPage);
		   
		  model.addAttribute("pageVO", pageVO);
	      model.addAttribute("list", list);
	      return "admin/csBoardList";
	   }
	
	@RequestMapping(value="adminCsDetail")
	public String getDetail(@RequestParam int num, Model model) {
		CsVO csVO = csDao.getCsVO(num);
		
		model.addAttribute("csVO",csVO);
		return "/admin/csDetail";
	}	
	// 이인혁 20181206 끝
	
	// 전치용 20181207 추가
	// 영화 등록 페이지로 이동하기
	@RequestMapping(value="charts", method=RequestMethod.GET)
	public String charts(Model model) {

		return "admin/charts";
	}
	// 전치용 20181207 끝
	
	
	// 이인혁 2018127 추가
	@RequestMapping(value="reply")
	public String reply(@RequestParam int num, @RequestParam String reply_content) {
		
		 adminDao.updateReply(num, reply_content);
		
		return "redirect:/admin/cs";
	}
	
	
	// 김수빈20181209추가
	@RequestMapping(value="noticeWrite")
	public String noticeWrite() {
		
		return "/admin/noticeWrite";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	    public String insert(@ModelAttribute NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
	        noticeVO.setNt_readCount(0);
	        noticeVO.setNt_writeDate(new Timestamp(System.currentTimeMillis()).toString());
	        noticeVO.setNt_writeIP(request.getRemoteAddr());
	        noticeService.insert(noticeVO); // 글 등록
	        
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('공지 등록이 완료되었습니다.');");
	        out.println("location.href='/movie/admin/main'");
	        out.println("</script>");
	        return null;
	}
	
	
	// 김수빈20181209추가
    @RequestMapping(value="noticeList")
    public String noticeList(@RequestParam(value="pageNum", required=false, 
            defaultValue="1") int pageNum, Model model, HttpSession session) {
        
        String id = (String) session.getAttribute("mb_ID");
        System.out.println(id);
        
        int count = noticeService.getNoticeCount();
        int pageSize = 5;
        int startRow = (pageNum - 1) * pageSize + 1;
        
        List<NoticeVO> list = noticeService.getNoticeList(startRow);
        
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        int pageBlock = 5;
        int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        
        if(endPage > pageCount) {
            endPage = pageCount;
        }
        
        PageVO page = new PageVO();
        page.setCount(count);
        page.setPageNum(pageNum);
        page.setPageCount(pageCount);
        page.setPageBlock(pageBlock);
        page.setStartPage(startPage);
        page.setEndPage(endPage);
        
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        
        return "/admin/noticeList";
    }
	
    
    @RequestMapping("noticeContent")
    public String noticeContent(@RequestParam int nt_num, Model model, HttpSession session) {
        
        String id = (String) session.getAttribute("mb_ID");
        System.out.println(id);
        
        NoticeVO noticeVO = noticeService.getNoticeContent(nt_num);
        noticeVO.setNt_content(noticeVO.getNt_content().replace("\r\n", "<br>"));
        model.addAttribute("noticeVO", noticeVO);
        
        return "admin/noticeContent";
    }
	
    
    @RequestMapping("noticeUpdate")
    public String noticeUpdate(@RequestParam int nt_num, Model model) {
        System.out.println("NoticeController update");
        
        NoticeVO noticeVO = noticeService.getNotice(nt_num);

        model.addAttribute("noticeVO", noticeVO);
        
        return "admin/noticeUpdateForm";
    }
    
    @RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
    public ModelAndView noticeUpdate(@ModelAttribute NoticeVO noticeVO, @RequestParam(value="pageNum", required=false, 
            defaultValue="1") int pageNum) {
        int check = noticeService.updateNotice(noticeVO);
        
        if(check == 1) System.out.println("음 잘넘어왔군!!");
        
        ModelAndView mav = new ModelAndView("redirect:/admin/noticeList");
        mav.addObject("pageNum", pageNum);
        
        return mav;
    }
    
    @RequestMapping(value = "noticeDelete")
    public ModelAndView noticeDelete(@ModelAttribute NoticeVO noticeVO, @RequestParam(value="pageNum", required=false, 
            defaultValue="1") int pageNum) {
        int check = noticeService.deleteNotice(noticeVO);
        
        if(check == 1) System.out.println("삭제가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
        
        ModelAndView mav = new ModelAndView("redirect:/admin/noticeList");
        mav.addObject("pageNum", pageNum);
        
        
        return mav;
    }
    
    
    @RequestMapping(value="csDelete")
    public String csDelete(@RequestParam(value="check", required=false) int num[],HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
/* 		if(num==null) {
 			try { 				

 				out.println("<script>alert('게시글을 선택하지 않아 삭제 불가'); history.back();</script>");
 				out.close();
 				return null;
 			} catch (IOException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		}*/
 		
	    if(num==null) {
            out = response.getWriter();
            out.println("<script>alert('삭제할 글이 선택되지 않았습니다.'); location.href=history.back();</script>");
            out.close();
            return null;
	    } else {
	        for(int i = 0; i < num.length; i++) {
	            csDao.deleteCs(num[i]);
	        }
            out = response.getWriter();
            out.println("<script>alert('문의글이 삭제되었습니다.'); location.href='/movie/admin/cs';</script>");
            out.close();
            return null;
	    }



    }
    
    
    
    
/*	// 공지사항 추가
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@ModelAttribute NoticeVO noticeVO, HttpServletRequest request) throws Exception {
        System.out.println("NoticeController insert");
        
        noticeVO.setNt_readCount(0);
        noticeVO.setNt_writeDate(new Timestamp(System.currentTimeMillis()).toString());
        noticeVO.setNt_writeIP(request.getRemoteAddr());
        noticeService.insert(noticeVO); // 글 등록
        return "redirect:/notice/list";
    }*/
	
	

	
	
	
}
