package com.spring.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void reservate(ReservationVO reservationVO) throws Exception {
		sqlSession.insert("reserMapper.reservate",reservationVO);
		
	}



	@Override
	public void cancel(int rNum) throws Exception {
		sqlSession.delete("reserMapper.cancel",rNum);
		
	}

	@Override
	public void updateReser(ReservationVO reservationVO) throws Exception {
		
		
	}

	

	@Override
	public void complete(int cartNum) throws Exception {
		sqlSession.delete("reserMapper.complete",cartNum);
		
	}

	@Override
	public List<ReservationVO> myLecture(String mId) throws Exception {
		return sqlSession.selectList("reserMapper.myLecture",mId);
	}



	@Override
	public List<MyLectureVO> myLectureDetail(ReservationVO reservationVO) throws Exception {
		return sqlSession.selectList("reserMapper.myLectureDetail",reservationVO);
	}



	@Override
	public List<ReservationVO> adminOrderList() throws Exception {
		return sqlSession.selectList("reserMapper.adminOrderList");
	}


	

}
