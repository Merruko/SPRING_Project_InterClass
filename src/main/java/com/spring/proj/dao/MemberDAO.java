package com.spring.proj.dao;

import java.util.List;

import com.spring.proj.domain.MemberVO;

public interface MemberDAO {
	
	//1. 회원등록
	public void insertMember(MemberVO vo);
	
	//2. 회원삭제
	public void deleteMember(MemberVO vo);
	
	//3. 회원전체목록
	public List<MemberVO> selectAll();
	
	//4. 회원상세정보
	public MemberVO findById(String mId);
	
	//5. 회원수정
	public void updateMember(MemberVO vo);
	
	//6. 로그인
	public MemberVO login(MemberVO vo);
	
	//7. 아이디 찾기
	public String findId(String mEmail);
	
	//8. 비밀번호 찾기
	public String findPwd(String mId);
	
}