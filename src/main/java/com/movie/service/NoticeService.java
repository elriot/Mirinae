package com.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.domain.NoticeVO;
import com.movie.repository.NoticeDao;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	public void insert(NoticeVO noticeVO) {
		System.out.println("NoticeService insert");
		noticeDao.insert(noticeVO);
	} // 공지사항 쓰기
	
	public int getNoticeCount() {
		System.out.println("NoticeService getNoticeCount");
		return noticeDao.count();
	}
	
	public List<NoticeVO> getNoticeList(int startRow) {
		System.out.println("NoticeService getNoticeList");
		return noticeDao.getNoticeList(startRow);
	}
	
	public NoticeVO getNoticeContent(int num) {
		System.out.println("NoticeService getNoticeContent");
		
		noticeDao.updateNoticeReadcount(num);
		
		System.out.println("NoticeService updateNoticeReadCount");
		
		return noticeDao.getNotice(num);
	}
	
	public NoticeVO getNotice(int num) {
		return noticeDao.getNotice(num);
	}
	
	public int updateNotice(NoticeVO notice) {
		System.out.println("NoticeService updateNotice");
		
		noticeDao.getNotice(notice.getNt_num());
		
		noticeDao.updateNotice(notice);
		
		return 1;
	}
	
	public int deleteNotice(NoticeVO noticeVO) {
		System.out.println("NoticeService deleteNotice");
		
		noticeDao.getNotice(noticeVO.getNt_num());
		noticeDao.deleteNotice(noticeVO.getNt_num());
		
		return 1;
	}
}