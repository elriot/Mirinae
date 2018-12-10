package com.movie.domain;

public class CsVO {
	
	private int num;
	private String cs_type;
	private String id;
	private String title;
	private String content;
	private String reply_content;
	private String reg_date;
	private String reply;
	private String reply_date;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCs_type() {
		return cs_type;
	}
	public void setCs_type(String cs_type) {
		this.cs_type = cs_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "CsVO [num=" + num + ", cs_type=" + cs_type + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", reply_content=" + reply_content + ", reg_date=" + reg_date + ", reply=" + reply + ", reply_date="
				+ reply_date + "]";
	}
	
	
	
	
	
	
}
