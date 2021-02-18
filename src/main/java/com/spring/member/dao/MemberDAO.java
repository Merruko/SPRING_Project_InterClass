package com.spring.member.dao;

import java.util.List;

import com.spring.member.domain.MemberVO;
import com.spring.paging.util.SearchVO;

public interface MemberDAO {
	
	//1. 회원등록
	public void insertMember(MemberVO vo) throws Exception;
	
	//2. 회원삭제
	public void deleteMember(MemberVO vo) throws Exception;
	
	//3. 회원전체목록
	public List<MemberVO> selectAll() throws Exception;
	
	//4. 회원상세정보
	public MemberVO findById(String mId) throws Exception;
	
	//5. 회원정보수정(사용자, 비밀번호변경 불가)
	public void updateMember(MemberVO vo) throws Exception;
	
	//5-1. 회원정보수정(관리자, 비밀번호변경까지가능)
	public void updateMemberByAdmin(MemberVO vo) throws Exception;
	
	//6. 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//7. 비밀번호 변경
	public void updatePwd(MemberVO vo) throws Exception;
	
	//8. 아이디 찾기
	public String findId(String mEmail) throws Exception;
	
	//9. 비밀번호 찾기
	public String findPwd(String mId) throws Exception;
	
	//10. 총 멤버 수
	public int countAll(SearchVO search) throws Exception;
		
	//11. 페이징 처리 멤버 조회
	public List<MemberVO> selectAll(SearchVO search) throws Exception;
}
