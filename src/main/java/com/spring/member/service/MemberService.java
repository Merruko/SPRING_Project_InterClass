package com.spring.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.spring.member.domain.MemberVO;
import com.spring.paging.util.SearchVO;

public interface MemberService {
	
	//1. 회원가입
	public void register(MemberVO vo) throws Exception;
	
	//2. 회원삭제(탈퇴)
	public void unregister(MemberVO vo) throws Exception;
	
	//3. 회원전체목록
	public List<MemberVO> getAllUsers() throws Exception;
	
	//4. 회원상세정보
	public MemberVO getOneUser(String mId) throws Exception;
	
	//5. 회원정보수정(사용자, 비밀번호변경 불가)
	public void modifyInfo(MemberVO vo) throws Exception;
	
	//5-1. 회원정보수정(관리자, 비밀번호변경까지가능)
	public void modifyInfoByAdmin(MemberVO vo) throws Exception;
	
	//6. 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//7. 비밀번호변경
	public void modifyPass(MemberVO vo) throws Exception;
	
	//8. 아이디 찾기
	public String findId(HttpServletResponse response, String email) throws Exception;
	
	//9. 비밀번호 찾기
	public String findPwd(HttpServletResponse response, String id) throws Exception;
	
	//10. 총 멤버 수
	public int totalMember(SearchVO search) throws Exception;
	
	//11. 페이징 처리 멤버 조회
	public List<MemberVO> getAllUsers(SearchVO search) throws Exception;

}
