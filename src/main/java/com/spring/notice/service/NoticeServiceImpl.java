package com.spring.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.notice.dao.NoticeDAO;
import com.spring.notice.domain.NoticeVO;

@Service("boardService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO boardDAO;

	public void insertBoard(NoticeVO vo) {
		boardDAO.insertBoard(vo);
	}

	public void updateBoard(NoticeVO vo) {
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(NoticeVO vo) {
		boardDAO.deleteBoard(vo);
	}

	public NoticeVO getBoard(NoticeVO vo) {
		return boardDAO.getBoard(vo);
	}

	public List<NoticeVO> getBoardList(NoticeVO vo) {
		return boardDAO.getBoardList(vo);
	}

}