package com.spring.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.dao.LectureDAO;
import com.spring.board.domain.CartListVO;
import com.spring.board.domain.CartVO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.VideoVO;
import com.spring.board.util.FileUtils;

@Service
public class LectureServiceImpl implements LectureService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private LectureDAO dao;
	
	@Override
	public void write(LectureVO lectureVO) throws Exception {
		dao.write(lectureVO);
	}

	@Override
	public List<LectureVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public LectureVO read(int lectureNum) throws Exception {
		return dao.read(lectureNum);
	}

	@Override
	public void update(LectureVO lectureVO) throws Exception {
		dao.update(lectureVO);
	}

	@Override
	public void delete(int lectureNum) throws Exception {
		dao.delete(lectureNum);
	}

	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(lectureNum);
	}
	
	//카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception { 
		// TODO Auto-generated method stub
		dao.addCart(cart);	
	}
	
	@Override
	public List<CartListVO> cartList(String mId) throws Exception {
		// TODO Auto-generated method stub
		return dao.cartList(mId);
	}
		
	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		dao.deleteCart(cart);
	}

	@Override
	public void insertVideo(VideoVO vo) throws Exception {
		dao.insertVideo(vo);	
	}

	@Override
	public VideoVO videoView(int lectureNum) throws Exception {
		return dao.videoView(lectureNum);
	}
	
	//카트 중복 체크
	@Override
	public CartListVO cartCheck(CartListVO vo) throws Exception {
		// TODO Auto-generated method stub			
		return dao.cartCheck(vo);
	}

}