package com.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.domain.CartListVO;
import com.spring.board.domain.CartVO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.VideoVO;

public interface LectureService {
		
	public void write(LectureVO lectureVO) throws Exception;
	
	public List<LectureVO> list() throws Exception;

	//강의 조회
	public LectureVO read(int lectureNum) throws Exception;
	
	public void update(LectureVO lectureVO) throws Exception;
	
	public void delete(int lectureNum) throws Exception;

	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception;

	//카트 담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 조회
	public List<CartListVO> cartList(String mId) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//영상등록
	public void insertVideo(VideoVO vo) throws Exception;
	public VideoVO videoView(int lectureNum) throws Exception;
	
	//카트 중복 체크
	public CartListVO cartCheck(CartListVO vo) throws Exception;
	
}