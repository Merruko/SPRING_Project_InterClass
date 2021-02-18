package com.spring.proj.home;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.board.domain.LectureVO;
import com.spring.notice.domain.NoticeVO;

@Service
public class HomeServiceImpl implements HomeService{
	@Inject
	private HomeDAO dao;
	
	@Override
	public List<LectureVO> newLecture(LectureVO vo) throws Exception {
		return dao.newLecture(vo);
	}

	@Override
	public List<NoticeVO> newNotice(NoticeVO vo) throws Exception {
		return dao.newNotice(vo);
	}

}
