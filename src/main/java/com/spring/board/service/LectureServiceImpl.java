package com.spring.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.dao.CartListVO;
import com.spring.board.dao.CartVO;
import com.spring.board.dao.LectureDAO;
import com.spring.board.domain.LectureVO;
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
		
//		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(lectureVO, mpRequest);
//		int size = list.size();
//		for(int i=0; i<size; i++) {
//			dao.insertFile(list.get(i));
//		}
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

	// 첨부파일 조회
		@Override
		public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception {
			return dao.selectFileList(lectureNum);
	
		}
		//카트 담기
		@Override
		public void addCart(CartVO cart) throws Exception { 
			dao.addCart(cart);
			
		}
		@Override
		public List<CartListVO> cartList(String mId) throws Exception {
			
			
			return dao.cartList(mId);
		}
		
		@Override
		public List<LectureVO> newLecture(LectureVO vo) throws Exception {
			return dao.newLecture(vo);
		}
		
		//카트 삭제
		@Override
		public void deleteCart(CartVO cart) throws Exception{
			dao.deleteCart(cart);
		}
	
	

}
