package com.spring.board.service;

import java.util.List;
import java.util.Map;

import com.spring.board.dao.CartListVO;
import com.spring.board.dao.CartVO;
import com.spring.board.domain.LectureVO;


public interface LectureService {
		
	public void write(LectureVO lectureVO) throws Exception;
	
	public List<LectureVO> list() throws Exception;

	//강의 조회
	public LectureVO read(int lectureNum) throws Exception;
	
	public void update(LectureVO lectureVO) throws Exception;
	
	public void delete(int lectureNum) throws Exception;

	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception;

	//카트 담기
	public void addCart(CartVO cart) throws Exception; 
	//카트 조회
	
	public List<CartListVO> cartList(String mId) throws Exception;
	
	public List<LectureVO> newLecture(LectureVO vo) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	
	
}
