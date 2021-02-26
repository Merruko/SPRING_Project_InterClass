package com.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.domain.CartListVO;
import com.spring.board.domain.CartVO;
import com.spring.board.domain.LectureVO;
import com.spring.board.domain.VideoVO;
import com.spring.board.service.*;
import com.spring.member.dao.MemberDAOImpl;
import com.spring.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	@Inject
	LectureService service;
	
	@Autowired
	MemberServiceImpl memService;
	
	@Autowired
	MemberDAOImpl memDAO;
	
	// 쇼핑몰 글 작성화면
	@RequestMapping(value="/writeView",method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST ,produces="text/plain;charset=UTF-8")
	public String write(LectureVO lectureVO ,HttpServletRequest request) throws Exception{
				
		logger.info("write");
		String path = request.getSession().getServletContext().getRealPath("/");
				
		MultipartFile lecsImage = lectureVO.getLecsImage();
			
		if(!lecsImage.isEmpty()) {
			String lectureImage = lecsImage.getOriginalFilename();
			lecsImage.transferTo(new File(path+"resources/upload/"+lectureImage));
			lectureVO.setLectureImage(lectureImage);
					
			System.out.println("ファイル名 : "+lectureImage);
		} else {
			String lectureImage = "";
			lectureVO.setLectureImage(lectureImage);
		}
				
		service.write(lectureVO);
				
		return "redirect:/lecture/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value="/list",method= RequestMethod.GET)
	public String list(LectureVO lectureVO,Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list());
		
		List<Map<String, Object>> fileList = service.selectFileList(lectureVO.getLectureNum());
		model.addAttribute("file", fileList);
		return "lecture/list";
	}
	
	// 강의 조회
	@RequestMapping(value="/readView",method= RequestMethod.GET)
	public String read(LectureVO lectureVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read",service.read(lectureVO.getLectureNum()));
		
		List<Map<String, Object>> fileList = service.selectFileList(lectureVO.getLectureNum());
		model.addAttribute("file", fileList);
		return "lecture/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(LectureVO lectureVO, Model model) throws Exception{
		logger.info("updateView");
			
		model.addAttribute("update", service.read(lectureVO.getLectureNum()));
			
		return "lecture/updateView";
	}
		
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(LectureVO lectureVO ,HttpServletRequest request) throws Exception{
		logger.info("update");
			
			String path = request.getSession().getServletContext().getRealPath("/");
			MultipartFile lecsImage = lectureVO.getLecsImage();
			
		if(!lecsImage.isEmpty()) {
			String lectureImage = lecsImage.getOriginalFilename();
			lecsImage.transferTo(new File(path+"resources/upload/"+lectureImage));
			lectureVO.setLectureImage(lectureImage);
				
			System.out.println("ファイル名 : "+lectureImage);
		}
			
		service.update(lectureVO);
			
		return "redirect:/lecture/list";
	}
		
		
	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(LectureVO lectureVO) throws Exception{
		logger.info("delete");
			
		service.delete(lectureVO.getLectureNum());
			
		return "redirect:/lecture/list";
	}
		
		
	@RequestMapping(value="/addCart" ,method = RequestMethod.POST)
	public String addCart(CartVO cart, Principal principal,Model model) throws Exception {
			 
		logger.info("addCart");
			
		String mId = principal.getName();
			 
		System.out.println(mId);
			 
			cart.setmID(mId);
			service.addCart(cart);
			
			return "redirect:/lecture/list";
	}
		
	@RequestMapping(value="/cartList" ,method = RequestMethod.GET)
	public String getCartList(@ModelAttribute("cartList") CartListVO cartListVO,Principal principal,Model model) throws Exception {
			 
		logger.info("cartList");
			
		String mID = principal.getName();
		System.out.println("mId:"+mID);
		model.addAttribute("mId",mID);
		List<CartListVO> cartList = service.cartList(mID);
		model.addAttribute("cartList",cartList);
			
		return "lecture/cartList";
	}	
		
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(Principal principal,
		@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		logger.info("deleteCart");

		String mId = principal.getName();
		System.out.println("ID :"+mId);
		int result = 0;
		int cartNum = 0;
				 
		if(mId != null) {
			cart.setmID(mId);
				  
			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
			    cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}    
			result = 1;
		}  
		return result;  
	}
	
	// 영상등록
	@RequestMapping(value="/insertVideo",method=RequestMethod.POST)
	public String insertVideo(@RequestParam()VideoVO vo,Model model) throws Exception{
		service.insertVideo(vo);
		return"lecture/list";
	}
		
	// 중복 확인
	@RequestMapping(value = "/cartCheck", method = RequestMethod.POST)
	@ResponseBody
	public int postIdCheck(Principal principal,HttpServletRequest req,CartListVO vo) throws Exception {
		logger.info("post idCheck");
		 
		String mId = principal.getName();
		vo.setmId(mId);
		System.out.println("----"+vo.getmId());
		CartListVO cartCheck =  service.cartCheck(vo);
		 
		int result = 0;
		 
		if(cartCheck != null) {
		 result = 1;
		} 
		 
		return result;
	}

}