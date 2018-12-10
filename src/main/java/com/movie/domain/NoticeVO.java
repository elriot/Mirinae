package com.movie.domain;

public class NoticeVO {
	private Integer nt_num;
	private String nt_subject;
	private String nt_content;
	private String nt_fileName;
	private String nt_writeDate;
	private String nt_writeIP;
	private Integer nt_readCount;
	
	public Integer getNt_num() {
		return nt_num;
	}
	public void setNt_num(Integer nt_num) {
		this.nt_num = nt_num;
	}
	public String getNt_subject() {
		return nt_subject;
	}
	public void setNt_subject(String nt_subject) {
		this.nt_subject = nt_subject;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public String getNt_fileName() {
		return nt_fileName;
	}
	public void setNt_fileName(String nt_fileName) {
		this.nt_fileName = nt_fileName;
	}
	public String getNt_writeDate() {
		return nt_writeDate;
	}
	public void setNt_writeDate(String nt_writeDate) {
		this.nt_writeDate = nt_writeDate;
	}
	public String getNt_writeIP() {
		return nt_writeIP;
	}
	public void setNt_writeIP(String nt_writeIP) {
		this.nt_writeIP = nt_writeIP;
	}
	public Integer getNt_readCount() {
		return nt_readCount;
	}
	public void setNt_readCount(Integer nt_readCount) {
		this.nt_readCount = nt_readCount;
	}
}