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
import com.movie.repository.MemberDao;


@Service
@Transactional
public class MemberService {
	
	public static final int ID_AND_PASSWD_OK = 1;
	public static final int ONLY_PASSWD_FAIL = 0;
	public static final int ID_AND_PASSWD_FAIL = -1;
	
	// @Autowired : 타입 정보를 기준으로 의존관계를 주입
	@Autowired
	private MemberDao memberDao;
	
	
	
	
	public void add(MemberVO memberVO) {
		System.out.println("memberservice.add");
		memberDao.add(memberVO);
		System.out.println(memberVO.getMb_ID());
	}
	
	public int userCheck(String id, String passwd) {
		MemberVO memberVO = memberDao.get(id);
		if (memberVO != null) { // id 값 일치
			if (memberVO.getMb_passwd().equals(passwd)) { // passwd 값 일치
				return ID_AND_PASSWD_OK;
			} else { // passwd 값 불일치
				return ONLY_PASSWD_FAIL;
			}
		} else {  // member == null
			return ID_AND_PASSWD_FAIL;
		}
		
	}
	
	public String emailCheck(String email) {
		MemberVO memberVO = memberDao.getId(email);
		String id = memberVO.getMb_ID();
		
		
		System.out.println("담겼잖아 : " + id);
		return id;
		}
	
	@Transactional(readOnly=true)
	public MemberVO get(String id) {
		return memberDao.get(id);
	}
	
	public void update(MemberVO memberVO) {
		memberDao.update(memberVO);
	}
	
	public void delete(String id) {
		memberDao.delete(id);
	}
	
	public List<MemberVO> getAll() {
		return memberDao.getAll();
	}
	
	public int countById(String id) {
		return memberDao.countById(id);
	}
	
	public int countByEmail(String email) {
		return memberDao.countByEmail(email);
	}
	
	public String searchIdPwd(String id){
		MemberVO memberVO = memberDao.getPwd(id);
		String passwd = memberVO.getMb_passwd();
		return passwd;
	}
	
	
	// 나의 예약정보 가져오기 1. 내 아이디로 가져오기
	public List<BookVO> getBookListByMbIDGroupByMvNum(String mb_ID){
		return memberDao.getBookListByMbIDGroupByMvNum(mb_ID);
	}
	
	// 나의 예약정보 가져오기 2. mv_nu으로 영화 타이틀 가져오기
	public MovieVO getMovieByMvNum(Integer mv_num){
		return memberDao.getMovieByMvNum(mv_num);
	}
	
	// 나의 예약정보 가져오기 3. 예약한 영화 별 좌석정보 가져오기
	public List<BookVO> getSeatNumByMbIDAndMvNum(String mb_id, Integer mv_num){
		return memberDao.getSeatNumByMbIDAndMvNum(mb_id, mv_num);
	}

	
	
	
	// 나의 예약정보 가져오기4. 내 아이디로만(그룹별)
	public List<BookVO> getBookListByMbID(String mb_ID){
		return memberDao.getBookListByMbID(mb_ID);
	}
	
	// 나의 예약정보 삭제하기 - 예약취소
	public void deleteBookByMbIDAndMvNum(String mb_ID, Integer mv_num){
		memberDao.deleteBookByMbIDAndMvNum(mb_ID, mv_num);
	}
	
	// 예약하면 +200 포인트 지급
	public void plusPoint(MemberVO memberVO) {				
		memberDao.plusPoint(memberVO);
	}
	
	// 예약취소하면 -200 포인트 차감
	public void MinusPoint(MemberVO memberVO) {		
		memberDao.MinusPoint(memberVO);
	}

	
}




