package com.spring.board.domain;

import java.util.Date;

public class CartVO {

	private int cartNum;
	private String mId;
	private int lectureNum;
	private int cartStock;
	private Date addDate;
		
	public int getCartNum() {
		return cartNum;
	}
	
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	
	public String getmId() {
		return mId;
	}
	
	public void setmID(String mId) {
		this.mId = mId;
	}
	
	public int getLectureNum() {
		return lectureNum;
	}
	
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	
	public int getCartStock() {
		return cartStock;
	}
	
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	
	public Date getAddDate() {
		return addDate;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}	
		
}