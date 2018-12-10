package com.movie.domain;


public class MemberVO {
	
	private Integer mb_num;
	private String mb_ID;
	private String mb_passwd;
	private String mb_name;
	private String mb_email;
	private String mb_phone;
	private String mb_grade;
	private Integer mb_point;
	private String mb_joinDate;
	public Integer getMb_num() {
		return mb_num;
	}
	public void setMb_num(Integer mb_num) {
		this.mb_num = mb_num;
	}
	public String getMb_ID() {
		return mb_ID;
	}
	public void setMb_ID(String mb_ID) {
		this.mb_ID = mb_ID;
	}
	public String getMb_passwd() {
		return mb_passwd;
	}
	public void setMb_passwd(String mb_passwd) {
		this.mb_passwd = mb_passwd;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_grade() {
		return mb_grade;
	}
	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}
	public Integer getMb_point() {
		return mb_point;
	}
	public void setMb_point(Integer mb_point) {
		this.mb_point = mb_point;
	}
	public String getMb_joinDate() {
		return mb_joinDate;
	}
	public void setMb_joinDate(String mb_joinDate) {
		this.mb_joinDate = mb_joinDate;
	}
	@Override
	public String toString() {
		return "MemberVO [mb_num=" + mb_num + ", mb_ID=" + mb_ID + ", mb_passwd=" + mb_passwd + ", mb_name=" + mb_name
				+ ", mb_email=" + mb_email + ", mb_phone=" + mb_phone + ", mb_grade=" + mb_grade + ", mb_point="
				+ mb_point + ", mb_joinDate=" + mb_joinDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
}