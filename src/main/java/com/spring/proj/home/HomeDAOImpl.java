package com.spring.proj.home;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.LectureVO;
import com.spring.notice.domain.NoticeVO;

@Repository
public class HomeDAOImpl implements HomeDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<LectureVO> newLecture(LectureVO vo) throws Exception {
		return sqlSession.selectList("HomeMapper.newLecture",vo);
	}

	@Override
	public List<NoticeVO> newNotice(NoticeVO vo) throws Exception {
		return sqlSession.selectList("HomeMapper.newNotice",vo);
	}

}
