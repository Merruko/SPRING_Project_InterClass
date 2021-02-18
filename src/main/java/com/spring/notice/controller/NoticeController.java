package com.spring.notice.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.notice.domain.NoticeListVO;
import com.spring.notice.domain.NoticeVO;
import com.spring.notice.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService boardService;

	@RequestMapping("/dataTransform")
	@ResponseBody
	public NoticeListVO dataTransform(NoticeVO vo) {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<NoticeVO> boardList = boardService.getBoardList(vo);
		NoticeListVO boardListVO = new NoticeListVO();
		boardListVO.setBoardList(boardList);
		return boardListVO;
	}
	
	// 글 등록
	@GetMapping("/insertBoard")
	public String signUp(NoticeVO vo) {
		System.out.println("insertBoard-GET");
		return "/notice/postNotice";
	}

	// 글 등록
	@PostMapping("/insertBoard")
	public String insertBoard(NoticeVO vo){
		System.out.println("insertBoard-POST");
		System.out.println("000: "+vo.getTitle()+" || "+vo.getWriter()+" || "+vo.getContent());
		boardService.insertBoard(vo);
		return "redirect:/notice/getBoardList";
	}

	// 글 수정
	@RequestMapping("/updateBoard")
	public String updateBoard(@ModelAttribute("board") NoticeVO vo) {
		boardService.updateBoard(vo);
		return "redirect:/notice/getBoardList";
	}

	// 글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(NoticeVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/notice/getBoardList";
	}

	// 글 상세 조회
	@RequestMapping("/getBoard")
	public String getBoard(NoticeVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "/notice/contentOfNotice";
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public LinkedHashMap<String, String> searchConditionMap() {
		LinkedHashMap<String, String> conditionMap = new LinkedHashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 글 목록 검색
	@RequestMapping("/getBoardList")
	public String getBoardList(NoticeVO vo, Model model) {

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "/notice/listOfNotice";
	}
}