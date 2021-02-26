package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.LectureVO;
import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;

public interface ReservationService {
	
	public void reservate(ReservationVO reservationVO) throws Exception;
	public List<ReservationVO> myLecture(String mId) throws Exception;
	public List<ReservationVO> adminOrderList() throws Exception;
	public void cancel(int rNum) throws Exception;
	public void delete(int rNum) throws Exception;
	public void updateReser(ReservationVO reservationVO) throws Exception;
	public List<MyLectureVO> myLectureDetail(ReservationVO reservationVO) throws Exception;
	public int checkReser(ReservationVO reservationVO) throws Exception; 

}