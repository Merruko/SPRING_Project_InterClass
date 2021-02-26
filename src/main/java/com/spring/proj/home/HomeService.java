package com.spring.proj.home;

import java.util.List;

import com.spring.board.domain.LectureVO;
import com.spring.notice.domain.NoticeVO;

public interface HomeService {
	
	public List<LectureVO> newLecture(LectureVO vo) throws Exception;
	public List<NoticeVO> newNotice(NoticeVO vo) throws Exception;
	
}