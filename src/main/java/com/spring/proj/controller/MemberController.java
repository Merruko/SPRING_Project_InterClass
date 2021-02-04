package com.spring.proj.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.proj.domain.MemberVO;
import com.spring.proj.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl memService;
	
	//회원가입
	@GetMapping("/signUp")
	public String signUp(@ModelAttribute MemberVO vo) {
		System.out.println("---joining member on going---");
		return "/signup/signUpForm";
	}
	
	@PostMapping("/signUp")
	public String signUpOn(@ModelAttribute @Valid MemberVO vo, BindingResult bindingResult, HttpServletRequest http) {
		System.out.println("---postmapping on going");
		
		if(bindingResult.hasErrors()) {
			System.out.println("회원가입 유효성 검사중 에러발생!!!");
			return "/signup/signUpForm";
		}
		memService.register(vo);
		http.setAttribute("mId", vo.getmId());
		System.out.println("postmapping completed---");
		//회원가입 완료 후 가입축하 페이지로
		return "/signup/signUpSuccess";
	}
	
	//회원탈퇴(사용자)
	@GetMapping("/deleteMyAccount")
	public String deleteInfo() {
		System.out.println("---deleting member information on going---");
		//delete에 필요한 id 값을 얻기위한 로그인페이지로 이동
		return "/user/deleteAccount";
	}
	
	@PostMapping("/deleteMyAccount")
	public String deleteInfoOn(MemberVO vo, HttpServletRequest http) {
		System.out.println("---postmapping on going");
		http.setAttribute("mId", vo.getmId());
		memService.unregister(vo);
		System.out.println("postmapping completed---");
		//회원탈퇴완료 페이지로
		return "/user/deleteSuccess";		
	}
	
	//회원삭제(관리자)
	@RequestMapping("/deleteMemberByAdmin")
	public String deleInfoByAdmin(MemberVO vo) {
		System.out.println("---deleting member <by Admin> postmapping on going");
		memService.unregister(vo);
		System.out.println("postmapping completed---");
		//관리자 회원전체목록으로
		return "redirect:/listMemberAll";	
	}
	
	//회원전체목록
	@RequestMapping("/listMemberAll")
	public String listLoadedByAdmin(Model model) {
		System.out.println("---loading all of members---");
		List<MemberVO> list = memService.getAllUsers();
		model.addAttribute("list", list);
		//회원전체목록 페이지로
		return "/admin/manageMember";
	}
	
	//회원상세정보
	@RequestMapping("/memberInfo")
	public String oneUser(Principal principal, Model model) {
		System.out.println("---loading one of members---");
		model.addAttribute("vo", memService.getOneUser(principal.getName()));
		return "/user/myInfo";
	}
	
	//회원수정
	@GetMapping("/updateMember")
	public String updateInfo(String mId, Model model) {
		System.out.println("---loading one of members to modify---");
		MemberVO vo = memService.getOneUser(mId);
		model.addAttribute("vo", vo);
		//회원수정페이지로
		return "/user/myInfoChange";
	}
	
	@PostMapping("/updateMember")
	public String updateInfoOn(MemberVO vo) {
		System.out.println("---postmapping on going");
		memService.modifyInfo(vo);
		System.out.println("postmapping completed---");
		//수정완료후 회원상세정보 다시 불러오기
		return "redirect:/memberInfo";
	}
	
	//비밀번호변경
	@GetMapping("/modifyPwd")
	public String changePassword() {
		return "/user/modifyPwd";
	}
	
	@PostMapping("modifyPwd")
	public String pwdChanged() {
		return "/user/modifyPwdSuccess";
	}

}