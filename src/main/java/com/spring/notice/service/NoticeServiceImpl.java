package com.spring.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.notice.dao.NoticeDAO;
import com.spring.notice.domain.NoticeVO;
import com.spring.paging.util.PagingVO;
import com.spring.paging.util.SearchVO;

@Service("boardService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO boardDAO;

	@Override
	public void insertBoard(NoticeVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(NoticeVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(NoticeVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public NoticeVO getBoard(NoticeVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<NoticeVO> getBoardList(PagingVO pagination) {
		return boardDAO.getBoardList(pagination);
	}

	// 조회수 증가
	@Override
	public void plusCnt(int seq) {
		boardDAO.updateCnt(seq);
	}
	
	// 총 게시글 개수 확인
	@Override
	public int getNoticeListCnt(SearchVO search) throws Exception {
		return boardDAO.getNoticeListCnt(search);
	}

}