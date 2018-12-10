package com.movie.web;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.MemberVO;
import com.movie.service.MemberService;

@RequestMapping("mail")
@Controller // 컨트롤러 인식
public class MailController {
	
	@Autowired // new 생성자역할
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	

	// mailSending 코드
	@RequestMapping(value = "mail") // 맵핑잡아주기
	@ResponseBody
	public String mailSending(@RequestParam String email) { // requestparam string 으로 유저이메일을 받음
		//responseBody를 쓰면 띄워진 화면내에서 결과를 냄 
		System.out.println("mailController시작");
		
		Random rnd = new Random();

		StringBuffer buf =new StringBuffer();
		
		for(int i= 1; i < 7; i++) {
			int rIndex = rnd.nextInt(3);
			switch(rIndex) {
			
			case 0: //a~z
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));

				break;
				
			case 1: // A~Z
				buf.append((char)((int)(rnd.nextInt(26))+65));
				
			case 2: // 0~9
				buf.append((rnd.nextInt(10)));
				break;
			}
			
		}
		System.out.println("난수값 : " + buf);
		
		 
		String setfrom = "ryobingun@gmail.com";
		String tomail = email; // 받는 사람 이메일
		String title = "회원가입 인증번호 입니다"; // 제목
		String content = "인증번호는 "+ buf +" 입니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

	 return buf.toString();
	}
	
	
	@RequestMapping(value = "mailPwd") // 맵핑잡아주기
	public String mailPwdSending(MemberVO memberVO, @RequestParam String mb_ID,@RequestParam String mb_email, HttpServletResponse response) { // requestparam string 으로 유저이메일을 받음
		//responseBody를 쓰면 띄워진 화면내에서 결과를 냄 
		System.out.println("mailController시작");
		
		
		String id = memberVO.getMb_ID();
		String email = memberVO.getMb_email();
		String passwd = memberService.searchIdPwd(mb_ID);
		System.out.println(id + "\n" + email + "\n" + passwd);
 
		String setfrom = "ryobingun@gmail.com";
		String tomail = mb_email; // 받는 사람 이메일
		String title = "고객님께서 찾은 패스워드 입니다"; // 제목
		String content = "고객님의 패스워드는"+passwd+"입니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('회원님의 이메일로 비밀번호 발송 되었습니다.');");
	        out.println("location.href='/movie/'");
	        out.println("</script>");
	        out.close();
	        return null;
	        
		} catch (Exception e) {
			System.out.println(e);
		}
	 return "redirect:/movie/";
	}
	
	
}
