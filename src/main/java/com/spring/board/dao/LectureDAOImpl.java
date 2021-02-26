package com.spring.board.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.CartListVO;
import com.spring.board.domain.CartVO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.VideoVO;

@Repository
public class LectureDAOImpl implements LectureDAO {
 
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(LectureVO lectureVO) throws Exception {
		sqlSession.insert("boardMapper.insert",lectureVO);
	}

	@Override
	public List<LectureVO> list() throws Exception {
		return sqlSession.selectList("boardMapper.list");
	}

	@Override
	public LectureVO read(int lectureNum) throws Exception {
		return sqlSession.selectOne("boardMapper.read",lectureNum);
	}
	
	//강의 수정
	@Override
	public void update(LectureVO lectureVO) throws Exception {
		sqlSession.update("boardMapper.update",lectureVO);
		
	}
	//강의 삭제
	@Override
	public void delete(int lectureNum) throws Exception {
		sqlSession.delete("boardMapper.delete",lectureNum);
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insertFile", map);
	}
		
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectFileList", lectureNum);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		sqlSession.insert("boardMapper.addCart",cart);	
	}
	
	@Override
	public List<CartListVO> cartList(String mId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.cartList",mId); 
	}	

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteCart",cart);
	}
	
	@Override
	public void insertVideo(VideoVO vo) throws Exception {
		sqlSession.insert("boardMapper.insertVideo",vo);	
	}
	
	@Override
	public VideoVO videoView(int lectureNum) throws Exception {
		return sqlSession.selectOne("boardMapper.videoView",lectureNum);
	}	
		
	@Override
	public CartListVO cartCheck(CartListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.cartCheck",vo);
	}


}