package com.spring.board.domain;

import java.util.Date;

public class MyLectureVO {
	
	private int rNum;
	private String mId;
	private int lectureNum;
	private String lectureName;
	private String lectureImage;
	
	public String getLectureImage() {
		return lectureImage;
	}
	public void setLectureImage(String lectureImage) {
		this.lectureImage = lectureImage;
	}



	private int startDate;
	private Date orderDate;
	
	
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	@Override
	public String toString() {
		return "MyLectureVO [rNum=" + rNum + ", mId=" + mId + ", lectureNum=" + lectureNum + ", lectureName="
				+ lectureName + ", lectureImage=" + lectureImage + ", startDate=" + startDate + ", orderDate="
				+ orderDate + "]";
	}


	
	
}
