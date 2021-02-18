package com.spring.board.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dao.CartListVO;
import com.spring.board.dao.CartVO;
import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;
import com.spring.board.service.LectureService;
import com.spring.board.service.ReservationService;
import com.spring.member.service.MemberServiceImpl;


@Controller
@RequestMapping("/reser/")
public class ReserController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	@Inject
	ReservationService service;
	
	@Autowired
	LectureService lecture;
	@Autowired
	MemberServiceImpl member;
	
	@ResponseBody
	@RequestMapping(value="/reservation")
	public String reservationForm(int cartNum,@ModelAttribute CartListVO cart,ReservationVO reser,Principal principal,Model model) throws Exception{
		String mId = principal.getName();
		if(mId == null) {
			String error = "<script>alert('로그인해주세요');location.href='/login'</script>";
			return error;
		}
		model.addAttribute(mId);
		logger.info("--예약폼화면--");
		return "/reser/reservation";
	}
	
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public String reservation(CartVO cart,Principal principal,ReservationVO vo,Model model) throws Exception{
		logger.info("--예약 처리--");
		String mId = principal.getName();
		vo.setmId(mId);
		System.out.println("mId : "+mId);
		System.out.println(vo.toString());
		
		service.reservate(vo);
		System.out.println("예약완료");
		return "redirect:/";
	}
	
	@RequestMapping(value="/myLecture",method = RequestMethod.GET)
	public String myLecture(@ModelAttribute("myLecture") ReservationVO vo,Principal principal,Model model) throws Exception {
		
		logger.info("myLecture");
		String mId = principal.getName();
		model.addAttribute("mId",mId);
		vo.setmId(mId);
		List<ReservationVO> myLecture = service.myLecture(mId);
		model.addAttribute("myLecture",myLecture);
		return "reser/myLecture";
		
	}
	@RequestMapping(value="/myLectureDetail", method=RequestMethod.GET)
	public void getMyLectureDetail(Principal principal,@RequestParam("n")int rNum, ReservationVO vo,Model model) throws Exception {
		logger.info("myLectureDetail");
		
		String mId = principal.getName();
		vo.setmId(mId);
		vo.setrNum(rNum);
		
		List<MyLectureVO> detail = service.myLectureDetail(vo);
		model.addAttribute("detail",detail);
	}
	
	@RequestMapping(value="/adminOrderList", method = RequestMethod.GET)
	public void adminOrderList(Model model) throws Exception{
		logger.info("admin reservation list");
		
		List<ReservationVO> list = service.adminOrderList();
		model.addAttribute("list",list);
		
	}
	

	@RequestMapping(value="/cancel",method = RequestMethod.POST)
	public String cancelOrder(Principal principal,ReservationVO vo) throws Exception{
		logger.info("예약취소");
		
		String mId = principal.getName();
		vo.setmId(mId);
		int rNum = vo.getrNum();
		
		service.cancel(rNum);
		return "redirect:/reser/myLecture";
	}
	
}
