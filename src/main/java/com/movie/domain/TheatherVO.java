package com.movie.domain;

public class TheatherVO {
	private String tt_num;
	private String tt_seatNum;
	private String isBooked;
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
	public String getIsBooked() {
		return isBooked;
	}
	public void setIsBooked(String isBooked) {
		this.isBooked = isBooked;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TheatherVO [tt_num=");
		builder.append(tt_num);
		builder.append(", tt_seatNum=");
		builder.append(tt_seatNum);
		builder.append(", isBooked=");
		builder.append(isBooked);
		builder.append("]");
		return builder.toString();
	}
	
	
	 

	
	
	
}
