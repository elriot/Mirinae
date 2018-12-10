package com.movie.domain;
/*
create table book(
bk_num Integer AUTO_INCREMENT PRIMARY KEY,
mb_ID varchar(20),
mv_num Integer,
tt_num varchar(20),
tt_seatNum varchar(20),
bk_date varchar(20),
bk_wDate varchar(20),
rg_time varchar(20),
bk_price Integer,
bk_paid varchar(20)
);
*/

public class BookVO {
	private Integer bk_num;
	private String mb_ID;
	private Integer mv_num;
	private String tt_num;
	private String tt_seatNum;
	private String bk_date;
	private String bk_wDate;
	private String mv_time;
	private Integer bk_price;
	private String bk_paid;
	private String mv_title;
	
	
	
	
	
	
	public String getMv_title() {
		return mv_title;
	}




	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}




	public Integer getBk_num() {
		return bk_num;
	}




	public void setBk_num(Integer bk_num) {
		this.bk_num = bk_num;
	}




	public String getMb_ID() {
		return mb_ID;
	}




	public void setMb_ID(String mb_ID) {
		this.mb_ID = mb_ID;
	}




	public Integer getMv_num() {
		return mv_num;
	}




	public void setMv_num(Integer mv_num) {
		this.mv_num = mv_num;
	}




	public String getTt_num() {
		return tt_num;
	}




	public void setTt_num(String tt_num) {
		this.tt_num = tt_num;
	}




	public String getTt_seatNum() {
		return tt_seatNum;
	}




	public void setTt_seatNum(String tt_seatNum) {
		this.tt_seatNum = tt_seatNum;
	}




	public String getBk_date() {
		return bk_date;
	}




	public void setBk_date(String bk_date) {
		this.bk_date = bk_date;
	}




	public String getBk_wDate() {
		return bk_wDate;
	}




	public void setBk_wDate(String bk_wDate) {
		this.bk_wDate = bk_wDate;
	}




	public String getMv_time() {
		return mv_time;
	}




	public void setMv_time(String mv_time) {
		this.mv_time = mv_time;
	}




	public Integer getBk_price() {
		return bk_price;
	}




	public void setBk_price(Integer bk_price) {
		this.bk_price = bk_price;
	}




	public String getBk_paid() {
		return bk_paid;
	}




	public void setBk_paid(String bk_paid) {
		this.bk_paid = bk_paid;
	}




	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BookVO [bk_num=");
		builder.append(bk_num);
		builder.append(", mb_ID=");
		builder.append(mb_ID);
		builder.append(", mv_num=");
		builder.append(mv_num);
		builder.append(", tt_num=");
		builder.append(tt_num);
		builder.append(", tt_seatNum=");
		builder.append(tt_seatNum);
		builder.append(", bk_date=");
		builder.append(bk_date);
		builder.append(", bk_wDate=");
		builder.append(bk_wDate);
		builder.append(", mv_time=");
		builder.append(mv_time);
		builder.append(", bk_price=");
		builder.append(bk_price);
		builder.append(", bk_paid=");
		builder.append(bk_paid);
		builder.append("]");
		return builder.toString();
	}
	
	

	
	


	
}




