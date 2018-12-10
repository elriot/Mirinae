package com.movie.domain;

public class RegisterVO {
	private int rg_num;
	private String tt_num;
	private String mv_title;
	private String rg_startDate;
	private String rg_endDate;
	private String rg_time;
	public int getRg_num() {
		return rg_num;
	}
	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}
	public String getTt_num() {
		return tt_num;
	}
	public void setTt_num(String tt_num) {
		this.tt_num = tt_num;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getRg_startDate() {
		return rg_startDate;
	}
	public void setRg_startDate(String rg_startDate) {
		this.rg_startDate = rg_startDate;
	}
	public String getRg_endDate() {
		return rg_endDate;
	}
	public void setRg_endDate(String rg_endDate) {
		this.rg_endDate = rg_endDate;
	}
	public String getRg_time() {
		return rg_time;
	}
	public void setRg_time(String rg_time) {
		this.rg_time = rg_time;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RegisterVO [rg_num=");
		builder.append(rg_num);
		builder.append(", tt_num=");
		builder.append(tt_num);
		builder.append(", mv_title=");
		builder.append(mv_title);
		builder.append(", rg_startDate=");
		builder.append(rg_startDate);
		builder.append(", rg_endDate=");
		builder.append(rg_endDate);
		builder.append(", rg_time=");
		builder.append(rg_time);
		builder.append("]");
		return builder.toString();
	}
	
}
