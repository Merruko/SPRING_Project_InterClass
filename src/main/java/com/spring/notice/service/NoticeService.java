package com.spring.notice.service;

import java.util.List;

import com.spring.notice.domain.NoticeVO;

public interface NoticeService {
	
	// 글 등록
	void insertBoard(NoticeVO vo);

	// 글 수정
	void updateBoard(NoticeVO vo);

	// 글 삭제
	void deleteBoard(NoticeVO vo);

	// 글 상세 조회
	NoticeVO getBoard(NoticeVO vo);

	// 글 목록 조회
	List<NoticeVO> getBoardList(NoticeVO vo);
	
}