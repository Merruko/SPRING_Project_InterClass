package com.spring.board.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.LectureVO;

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
			sqlSession.insert("boardMapper.insertFile", map);
		}
		
		// 첨부파일 조회
		@Override
		public List<Map<String, Object>> selectFileList(int lectureNum) throws Exception {
			return sqlSession.selectList("boardMapper.selectFileList", lectureNum);
		}

		@Override
		public void addCart(CartVO cart) throws Exception {
			sqlSession.insert("boardMapper.addCart",cart);
			
		}
		@Override
		public List<CartListVO> cartList(String mId) throws Exception {
			return sqlSession.selectList("boardMapper.cartList",mId); 
		}	

		@Override
		public List<LectureVO> newLecture(LectureVO vo) throws Exception {
			return sqlSession.selectList("boardMapper.newLecture",vo);
		}	
		
		@Override
		public void deleteCart(CartVO cart) throws Exception {
			sqlSession.delete("boardMapper.deleteCart",cart);
			
		}	


}
