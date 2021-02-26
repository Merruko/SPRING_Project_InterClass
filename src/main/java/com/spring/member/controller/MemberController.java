package com.spring.member.controller;

import java.security.Principal;
import java.util.HashMap;

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
			System.out.println("会員登録の有効性検査中、エラー発生！！");
			return "/signup/signUpForm";
		} else {
			memService.register(vo);
			request.setAttribute("joined_mId", vo.getmId());
		}
		
		System.out.println("postmapping completed---");
		return "/signup/signUpSuccess";
	}

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
		//회원 탈퇴 완료시 로그아웃해서 세션 만료시킴
		return "redirect:/logout";		
	}
	
	//회원삭제 (only for 관리자)
	@RequestMapping("/deleteMemberByAdmin") 
	public String deleInfoByAdmin(MemberVO vo) throws Exception {
		System.out.println("---deleting member <by Admin> postmapping on going");
		memService.unregister(vo);
		System.out.println("postmapping completed---");
		//관리자 회원 전체 목록으로
		return "redirect:/listMemberAll";
	}

//	회원전체목록(only for 관리자) -- 페이징 처리 X
//	@RequestMapping("/listMemberAll")
//	public String listLoadedByAdmin(Model model) throws Exception {
//		System.out.println("---loading all of members---");
//		List<MemberVO> list = memService.getAllUsers();
//		model.addAttribute("list", list);
//		//회원전체목록 페이지로
//		return "/admin/manageMember";
//	}
	
	//회원전체목록(only for 관리자) -- 페이징 처리
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
		
//		(SearchVO에 PagingVO 상속시켜서 불필요해짐) 페이징 + 목록불러오기
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

	//회원수정(only for 관리자)
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
			System.out.println("会員修正の有効性検査中、エラー発生！！");
			return "/admin/updateMemberInfo";
		} else {
			memService.modifyInfoByAdmin(vo);
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
			System.out.println("会員修正の有効性検査中、エラー発生！！");
			return "/user/myInfoChange";
		} else {
			memService.modifyInfo(vo);
		}
		
		System.out.println("postmapping completed---");
		//수정완료 후 사용자정보로
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
	
	//아이디 찾기
	@GetMapping("/findId")
	public String findId() throws Exception {
		return "/secu/findId";
	}
	
	@PostMapping("/foundId")
	public String findId(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String u_name = request.getParameter("u_name");
		String u_mail = request.getParameter("u_mail");
		
		HashMap<String, String> hash = new HashMap<String, String>();
		hash.put("u_name", u_name);
		hash.put("u_mail", u_mail);
		
		String id = memService.findId(hash);
		
		if(id == null || id == "") {
			model.addAttribute("mId", null);
			request.setAttribute("msg", "入力した会員情報と一致するIDが存在しません。確認してください。");
		} else if (id != null) {
			model.addAttribute("mId", id);
			model.addAttribute("mName", u_name);
			request.setAttribute("msg", null);
		}
		
		return "/secu/foundId";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd() throws Exception {
		return "/secu/findPwd";
	}
	
	@PostMapping("/foundPwd")
	public String findPwd(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		//아이디 찾기에서 사용하지 않은 정보를 사용함으로써 보안유지를 하고자 함.
		String u_id = request.getParameter("u_id");
		String u_birth = request.getParameter("u_birth");
		String u_phone = request.getParameter("u_phone");
		
		//파라미터 두 개씩 짝지어서 pwd의 값을 가져오고 일치 할 경우 --> 비밀번호 변경 페이지로.
		HashMap<String, String> hash1 = new HashMap<String, String>();
		hash1.put("u_id", u_id);
		hash1.put("u_birth", u_birth);
		
		HashMap<String, String> hash2 = new HashMap<String, String>();
		hash2.put("u_birth", u_birth);
		hash2.put("u_phone", u_phone);
		
		//mapper에서 choose-when 사용하여 코드재활용
		String pass1 = memService.findPwd(hash1);
		String pass2 = memService.findPwd(hash2);
		
		if(pass1.equals(pass2) && pass1 != null && pass2 != null) {
			model.addAttribute("mId", u_id);
			request.setAttribute("msg", "");
		} else if(pass1 == null || pass2 == null || pass1 == "" || pass2 == ""){
			request.setAttribute("msg", "パスワード設定に問題があります。管理者にお問い合わせください。");
		} else {
			request.setAttribute("msg", "パスワードを探せません。入力した情報を改めて確認してください。");
		}
		
		//비밀번호 변경 form --> .jsp에서 modifyPwd맵핑 불러서 비밀번호 update 실행
		return "/secu/foundPwd";
	}

}