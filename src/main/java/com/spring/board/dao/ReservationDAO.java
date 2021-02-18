package com.spring.board.dao;

import java.util.List;

import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;

public interface ReservationDAO {
	public void reservate(ReservationVO reservationVO) throws Exception;
	public List<ReservationVO> myLecture(String mId) throws Exception;
	public List<ReservationVO> adminOrderList() throws Exception;
	public void cancel(int rNum) throws Exception;
	public void updateReser(ReservationVO reservationVO) throws Exception;
	public void complete(int cartNum) throws Exception;
	public List<MyLectureVO> myLectureDetail(ReservationVO reservationVO) throws Exception;
}
