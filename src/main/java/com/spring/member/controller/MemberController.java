package com.spring.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.domain.MemberVO;
import com.spring.member.service.MemberServiceImpl;
import com.spring.paging.util.SearchVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl memService;
	
	//회원가입
	@GetMapping("/signUp")
	public String signUp(@ModelAttribute MemberVO vo) throws Exception {
		System.out.println("---joining member on going---");
		return "/signup/signUpForm";
	}
	
	@PostMapping("/signUp")
	public String signUpOn(@ModelAttribute @Valid MemberVO vo, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		System.out.println("---postmapping on going");
		if(bindingResult.hasFieldErrors()) {
			System.out.println("회원가입 유효성 검사중 에러발생!!!");
			return "/signup/signUpForm";
		} else {
			memService.register(vo);
			request.setAttribute("joined_mId", vo.getmId());
		}
		
		System.out.println("postmapping completed---");
		return "/signup/signUpSuccess";
	}

/* 정보 삭제 Controller *********************************************************************************/
	//회원탈퇴(사용자)
	@GetMapping("/deleteMyAccount")
	public String deleteInfo(Principal principal, HttpServletRequest request) throws Exception {
		System.out.println("---deleting member information on going---");
		String mId = principal.getName();
		MemberVO vo = memService.getOneUser(mId);
		request.setAttribute("mId", mId);
		request.setAttribute("mPwd", vo.getmPwd());
		//delete에 필요한 id 값을 얻기위한 로그인페이지로 이동
		return "/user/deleteAccount";
	}
	
	@PostMapping("/deleteMyAccount")
	public String deleteInfoOn(Principal principal ) throws Exception {
		System.out.println("---postmapping on going");
		String mId = principal.getName();
		MemberVO vo = memService.getOneUser(mId);
		memService.unregister(vo);
		System.out.println("postmapping completed---");
		//회원탈퇴완료시 로그아웃해서 세션만료시킴(이게..최선..ㅎ)
		return "redirect:/logout";		
	}
	
	//회원삭제(only관리자)
	@RequestMapping("/deleteMemberByAdmin") 
	public String deleInfoByAdmin(MemberVO vo) throws Exception {
		System.out.println("---deleting member <by Admin> postmapping on going");
		memService.unregister(vo);
		System.out.println("postmapping completed---");
		//관리자 회원전체목록으로
		return "redirect:/listMemberAll";	
	}

/* 정보 불러오기 Controller *********************************************************************************/
//회원전체목록(only관리자) -- 페이징 처리 X
//	@RequestMapping("/listMemberAll")
//	public String listLoadedByAdmin(Model model) throws Exception {
//		System.out.println("---loading all of members---");
//		List<MemberVO> list = memService.getAllUsers();
//		model.addAttribute("list", list);
//		//회원전체목록 페이지로
//		return "/admin/manageMember";
//	}
	
	//회원전체목록(only관리자) -- 페이징 처리 O (ver.2)
	@RequestMapping("/listMemberAll")
	public String listLoadedByAdmin(Model model
									, @RequestParam(required = false, defaultValue = "1") int page
									, @RequestParam(required = false, defaultValue = "1") int range
									, @RequestParam(required = false, defaultValue = "memId") String searchType
									, @RequestParam(required = false) String keyword
									, @ModelAttribute("search") SearchVO search
									) throws Exception {
		System.out.println("---loading all of members---");
		
		//목록 내 회원 특정, 검색기능
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//페이지 토탈 카운트
		int listCnt = memService.totalMember(search);
		
//		(SearchVO에 PagingVO 상속시켜서 불필요해짐)페이징 + 목록불러오기
//		PagingVO pagination = new PagingVO();
//		pagination.pageInfo(page, range, listCnt);
//		model.addAttribute("pagination", pagination);
//		model.addAttribute("viewAll", memService.getAllUsers(pagination));
		
		//Search기능 + 페이징기능 + 목록불러오기
		search.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", search);
		model.addAttribute("viewAll", memService.getAllUsers(search));
		
		//회원전체목록 페이지로
		return "/admin/manageMemberPaging";
	}
	
	//회원상세정보
	@RequestMapping("/memberInfo")
	public String oneUser(Principal principal, Model model) throws Exception {
		System.out.println("---loading one of members---");
		model.addAttribute("vo", memService.getOneUser(principal.getName()));
		return "/user/myInfo";
	}

/* 정보 수정 Controller *********************************************************************************/
	//회원수정(only관리자)
	@GetMapping("/updateMemberByAdmin")
	public String updateMember(String mId, @ModelAttribute MemberVO vo, Model model) throws Exception {
		System.out.println("---loading one of members to modify---");
		vo = memService.getOneUser(mId);
		model.addAttribute("vo", vo);
		//회원수정페이지로
		return "/admin/updateMemberInfo";
	}
	
	@PostMapping("/updateMemberByAdmin")
	public String updateMemberOn(@ModelAttribute @Valid MemberVO vo, BindingResult bindingResult) throws Exception {
		System.out.println("---postmapping on going");
		
		if(bindingResult.hasFieldErrors()) {
			System.out.println("회원수정 유효성 검사중 에러발생!!!");
			return "/admin/updateMemberInfo";
		} else {
			memService.modifyInfo(vo);
		}
		
		System.out.println("postmapping completed---");
		//수정완료후 관리자 회원관리목록으로
		return "redirect:/listMemberAll";
	}
	
	//회원수정(사용자)
	@GetMapping("/updateMember")
	public String updateMyInfo(String mId, @ModelAttribute MemberVO vo, Model model) throws Exception {
		System.out.println("---loading one of members to modify---");
		vo = memService.getOneUser(mId);
		model.addAttribute("vo", vo);
		//회원수정페이지로
		return "/user/myInfoChange";
	}
	
	@PostMapping("/updateMember")
	public String updateMyInfoOn(@ModelAttribute @Valid MemberVO vo, BindingResult bindingResult) throws Exception {
		System.out.println("---postmapping on going");
		
		if(bindingResult.hasFieldErrors()) {
			System.out.println("회원수정 유효성 검사중 에러발생!!!");
			return "/user/myInfoChange";
		} else {
			memService.modifyInfo(vo);
		}
		
		System.out.println("postmapping completed---");
		//수정완료후 사용자정보로
		return "redirect:/memberInfo";
	}

	
	//비밀번호변경
	@GetMapping("/modifyPwdForm")
	public String changePassword(Principal principal, HttpServletRequest request) throws Exception {
		System.out.println("--- modifying password starts ---");
		    String mId = principal.getName();
		    MemberVO vo = memService.getOneUser(mId);
		    request.setAttribute("mId", mId);
		    request.setAttribute("currentPwd", vo.getmPwd());
		return "/user/modifyPwd";
	}
	
	@PostMapping("/modifyPwd")
	public String pwdChanged(MemberVO vo) throws Exception {
		System.out.println("---postmapping on going");
		memService.modifyPass(vo);
		System.out.println("postmapping completed---");
		
		return "redirect:/logout";
	}
	
	
/* + 대호님 */
	//아이디 찾기
	@GetMapping("/findId")
	public String findId() throws Exception {
		return "/secu/findId";
	}
	
	@RequestMapping("/findId")
	public String findId(HttpServletResponse response, @RequestParam("email") String mEmail, Model model) throws Exception {
		model.addAttribute("mId", memService.findId(response, mEmail));
		return "/secu/foundId";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd() throws Exception {
		return "/secu/findPwd";
	}
	
	@RequestMapping("/findPwd")
	public String findPwd(HttpServletResponse response, @RequestParam("id") String mId, Model model) throws Exception {
		model.addAttribute("mPwd", memService.findPwd(response, mId));
		return "/secu/foundPwd";
	}
	
}
