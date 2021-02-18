package com.spring.proj.home;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.domain.LectureVO;
import com.spring.notice.domain.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	HomeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(NoticeVO board,LectureVO vo,Model model) throws Exception{
		logger.info("Welcome home! The client locale is .");
		List<LectureVO> newLecture = service.newLecture(vo);
		List<NoticeVO> newNotice = service.newNotice(board);
		model.addAttribute("newLecture",newLecture);
		model.addAttribute("newNotice",newNotice);
		
		
	
		
		return "index";
	}
	
}
