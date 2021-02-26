package com.spring.board.domain;

import org.springframework.web.multipart.MultipartFile;

public class LectureVO {
		
	private int lectureNum;
	private String lectureName;
	private String lectureContent;
	private String lectureListContent;
	private String lectureImage;  //파일이름
	private MultipartFile lecsImage; //멀티파트
	
	public MultipartFile getLecsImage() {
		return lecsImage;
	}
	public void setLecsImage(MultipartFile lecsImage) {
		this.lecsImage = lecsImage;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public String getLectureListContent() {
		return lectureListContent;
	}
	public void setLectureListContent(String lectureListContent) {
		this.lectureListContent = lectureListContent;
	}
	public String getLectureImage() {
		return lectureImage;
	}
	public void setLectureImage(String lectureImage) {
		this.lectureImage = lectureImage;
	}
	
	@Override
	public String toString() {
		return "LectureVO [lectureNum=" + lectureNum + ", lectureName=" + lectureName + ", lectureContent="
				+ lectureContent + ", lectureListContent=" + lectureListContent + ", lectureImage=" + lectureImage
				+ "]";
	}
	
}