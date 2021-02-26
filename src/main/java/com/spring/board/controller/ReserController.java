package com.spring.board.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.CartListVO;
import com.spring.board.domain.CartVO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.MyLectureVO;
import com.spring.board.domain.ReservationVO;
import com.spring.board.domain.VideoVO;
import com.spring.board.service.LectureService;
import com.spring.board.service.ReservationService;
import com.spring.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/reser/*")
public class ReserController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	@Inject
	ReservationService service;
	
	@Autowired
	LectureService lecture;
	@Autowired
	MemberServiceImpl member;
	
	//메뉴 예약하기 눌렀을 때 예약폼
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String reservationForm(LectureVO lectureVO,ReservationVO reser,Principal principal,Model model) throws Exception{
		
		String mId = principal.getName();
		model.addAttribute(mId);
		List<LectureVO> list = lecture.list();
		model.addAttribute("lecture",list);
		logger.info("--予約フォーム画面--");
		return "/reser/reservation";

	}
	
	//예약 폼에서 예약기능
	@RequestMapping(value="/reservation_submit",produces = "text/html;charset=UTF-8", method=RequestMethod.POST)
	public String reservation(RedirectAttributes rttr,@RequestParam("lectureNum")int lectureNum,ReservationVO vo,Principal principal,Model model) throws Exception{
		logger.info("--予約の処理--");

		String mId = principal.getName();
		vo.setmId(mId);
		vo.setLectureNum(lectureNum);
		System.out.println(vo.toString());
		int check = service.checkReser(vo);
		if(check != 0) {
			System.out.println("ダブり予約！ 予約失敗");
			rttr.addFlashAttribute("msg", "既に申し込んだ講義です。");
			
		}else if(check == 0){
			service.reservate(vo);
			System.out.println("予約完了");
			System.out.println(vo.toString());
			rttr.addFlashAttribute("msg", "申し込み完了。");
		}
			return "redirect:/reser/myLecture";
	}
	
	//카트에 담겨있던 상품 예약기능
	@RequestMapping(value="reservation", produces="text/html;charset=UTF-8", method=RequestMethod.POST)
	public String reservation(RedirectAttributes rttr,ReservationVO vo,CartVO cart,Principal principal,Model model) throws Exception{
		
		logger.info("--予約の処理--");
		String mId = principal.getName();
		vo.setmId(mId);
	
		System.out.println(vo.toString());
		int check = service.checkReser(vo);
		if(check != 0) {
			System.out.println("ダブり予約！ 予約失敗");
			rttr.addFlashAttribute("msg", "既に申し込んだ講義です。");
		}else if(check == 0){
			service.reservate(vo);
			System.out.println("予約完了");
			System.out.println(vo.toString());
			rttr.addFlashAttribute("msg", "申し込み完了。");
		}
	
		return "redirect:/reser/myLecture";
		
	}

	//수강신청한 내강의 목록보기
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
	
	//신청한 강의 내용보기
	@RequestMapping(value="/myLectureDetail", method=RequestMethod.GET)
	public void getMyLectureDetail(Principal principal,@RequestParam("n")int rNum, ReservationVO vo,Model model) throws Exception {
		logger.info("myLectureDetail");
		
		String mId = principal.getName();
		vo.setmId(mId);
		vo.setrNum(rNum);
		
		List<MyLectureVO> detail = service.myLectureDetail(vo);
		
		model.addAttribute("detail",detail);
	}
	
	//관리자 예약 관리
	@RequestMapping(value="/adminOrderList", method = RequestMethod.GET)
	public void adminOrderList(Model model) throws Exception{
		logger.info("admin reservation list");
		
		List<ReservationVO> list = service.adminOrderList();
		
		model.addAttribute("list",list);
		
	}
	
	//회원 예약 취소
	@RequestMapping(value="/cancle",method = RequestMethod.GET)
	public String cancelOrder(Principal principal, int rNum) throws Exception{
		service.cancel(rNum);
		return "redirect:/reser/myLecture";
	}
	
	//관리자 예약 삭제
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(ReservationVO vo) throws Exception{
		logger.info("予約削除");
		service.delete(vo.getrNum());
		return "redirect:/reser/adminOrderList";
	}
	
	//관리자 수강신청한 회원의 정보열람
	@RequestMapping("/adminUserView")
	public String adminUserView(@RequestParam("n")String mId,Principal principal,Model model) throws Exception{
		String admin = principal.getName();
		model.addAttribute("member", member.getOneUser(mId));
		return "/reser/adminUserView";	
	}
	
	//강의 동영상 보기
	@RequestMapping("/lectureVideo")
	public String lectureVideo(@RequestParam("n")int lectureNum,VideoVO video,LectureVO vo,Model model) throws Exception{
		vo.setLectureNum(lectureNum);
		model.addAttribute("lecture",lecture.read(lectureNum));
		video.setLectureNum(lectureNum);
		model.addAttribute("videoId",lecture.videoView(lectureNum));
		return "/reser/lectureVideo";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Principal principal,ReservationVO vo,RedirectAttributes rttr) throws Exception{
		logger.info("変更の処理");
		String mId = principal.getName();
		vo.setmId(mId);
		service.updateReser(vo);
		rttr.addFlashAttribute("msg", "変更されました。");
		return "redirect:/reser/myLecture";
	}
	
}