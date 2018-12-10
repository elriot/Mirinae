package com.movie.web;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.movie.domain.NoticeVO;
import com.movie.domain.PageVO;
import com.movie.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

/*	@RequestMapping("insert")
	public String insert() {
		System.out.println("NoticeController insertForm");
		
		return "notice/insertForm";
	}*/

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
	
	@RequestMapping("list")
	public String list(@RequestParam(value="pageNum", required=false, 
			defaultValue="1") int pageNum, Model model, HttpSession session) {
		System.out.println("NoticeController list");
		
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
		
		return "notice/list";
	}
	
	@RequestMapping("content")
	public String content(@RequestParam int nt_num, Model model, HttpSession session) {
		System.out.println("NoticeController content");
		
		String id = (String) session.getAttribute("mb_ID");
		System.out.println(id);
		
		NoticeVO noticeVO = noticeService.getNoticeContent(nt_num);
		noticeVO.setNt_content(noticeVO.getNt_content().replace("\r\n", "<br>"));
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/content";
	}
	
	@RequestMapping("update")
	public String update(@RequestParam int nt_num, Model model) {
		System.out.println("NoticeController update");
		
		NoticeVO noticeVO = noticeService.getNotice(nt_num);

		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/updateForm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute NoticeVO noticeVO, @RequestParam String pageNum) {
		int check = noticeService.updateNotice(noticeVO);
		
		if(check == 1) System.out.println("음 잘넘어왔군!!");
		
		ModelAndView mav = new ModelAndView("redirect:/notice/list");
		mav.addObject("pageNum", pageNum);
		
		return mav;
	}
	
	@RequestMapping(value = "delete")
	public ModelAndView delete(@ModelAttribute NoticeVO noticeVO, @RequestParam String pageNum) {
		int check = noticeService.deleteNotice(noticeVO);
		
		if(check == 1) System.out.println("삭제가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		
		ModelAndView mav = new ModelAndView("redirect:/notice/list");
		mav.addObject("pageNum", pageNum);
		
		return mav;
	}
}