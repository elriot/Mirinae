package com.movie.domain;
/*
create table movie(
mv_num int AUTO_INCREMENT PRIMARY KEY,
mv_title varchar(20),
mv_rating varchar(20),
mv_detail varchar(1000),
mv_releaseDate varchar(20),
mv_postImage varchar(50),
mv_trailer varchar(100),
tt_num int,
mv_startDate varchar(20),
mv_endDate varchar(20),
mv_time varchar(20),
mv_isTrue varchar(10) default 'T'
);
*/			


public class MovieVO {
	private Integer mv_num;
	private String mv_title;
	private String mv_rating;
	private String mv_detail;
	private String mv_releaseDate;
	private String mv_postImage;
	private String mv_trailer;
	private Integer tt_num;
	private String mv_startDate;
	private String mv_endDate;
	private String mv_time;
	private String mv_isTrue;
	
	public String getMv_releaseDate() {
		return mv_releaseDate;
	}
	public void setMv_releaseDate(String mv_releaseDate) {
		this.mv_releaseDate = mv_releaseDate;
	}
	
	public Integer getMv_num() {
		return mv_num;
	}
	public void setMv_num(Integer mv_num) {
		this.mv_num = mv_num;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getMv_rating() {
		return mv_rating;
	}
	public void setMv_rating(String mv_rating) {
		this.mv_rating = mv_rating;
	}
	public String getMv_detail() {
		return mv_detail;
	}
	public void setMv_detail(String mv_detail) {
		this.mv_detail = mv_detail;
	}
	public String getMv_postImage() {
		return mv_postImage;
	}
	public void setMv_postImage(String mv_postImage) {
		this.mv_postImage = mv_postImage;
	}
	public String getMv_trailer() {
		return mv_trailer;
	}
	public void setMv_trailer(String mv_trailer) {
		this.mv_trailer = mv_trailer;
	}
	public Integer getTt_num() {
		return tt_num;
	}
	public void setTt_num(Integer tt_num) {
		this.tt_num = tt_num;
	}
	public String getMv_startDate() {
		return mv_startDate;
	}
	public void setMv_startDate(String mv_startDate) {
		this.mv_startDate = mv_startDate;
	}
	public String getMv_endDate() {
		return mv_endDate;
	}
	public void setMv_endDate(String mv_endDate) {
		this.mv_endDate = mv_endDate;
	}
	public String getMv_time() {
		return mv_time;
	}
	public void setMv_time(String mv_time) {
		this.mv_time = mv_time;
	}
	public String getMv_isTrue() {
		return mv_isTrue;
	}
	public void setMv_isTrue(String mv_isTrue) {
		this.mv_isTrue = mv_isTrue;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MovieVO [mv_num=");
		builder.append(mv_num);
		builder.append(", mv_title=");
		builder.append(mv_title);
		builder.append(", mv_rating=");
		builder.append(mv_rating);
		builder.append(", mv_detail=");
		builder.append(mv_detail);
		builder.append(", mv_releaseDate=");
		builder.append(mv_releaseDate);
		builder.append(", mv_postImage=");
		builder.append(mv_postImage);
		builder.append(", mv_trailer=");
		builder.append(mv_trailer);
		builder.append(", tt_num=");
		builder.append(tt_num);
		builder.append(", mv_startDate=");
		builder.append(mv_startDate);
		builder.append(", mv_endDate=");
		builder.append(mv_endDate);
		builder.append(", mv_time=");
		builder.append(mv_time);
		builder.append(", mv_isTrue=");
		builder.append(mv_isTrue);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
}
