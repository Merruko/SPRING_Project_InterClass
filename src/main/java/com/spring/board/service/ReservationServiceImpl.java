package com.spring.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.dao.ReservationDAO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Inject
	ReservationDAO dao;
	
	@Override
	public void reservate(ReservationVO reservationVO) throws Exception {
		dao.reservate(reservationVO);
	}

	@Override
	public List<ReservationVO> myLecture(String mId) throws Exception {
		return dao.myLecture(mId);
	}

	@Override
	public void cancel(int rNum) throws Exception {
		dao.cancel(rNum);
	}

	@Override
	public void updateReser(ReservationVO reservationVO) throws Exception {
		dao.updateReser(reservationVO);
	}

	@Override
	public List<MyLectureVO> myLectureDetail(ReservationVO reservationVO) throws Exception {
		return dao.myLectureDetail(reservationVO);
	}

	@Override
	public List<ReservationVO> adminOrderList() throws Exception {
		return dao.adminOrderList();
	}

	@Override
	public void delete(int rNum) throws Exception {
		dao.delete(rNum);
	}

	@Override
	public int checkReser(ReservationVO reservationVO) throws Exception {
		return dao.checkReser(reservationVO);
	}

}