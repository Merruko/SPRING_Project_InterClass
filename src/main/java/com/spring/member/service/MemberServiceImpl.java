package com.spring.member.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.member.dao.MemberDAOImpl;
import com.spring.member.domain.MemberVO;
import com.spring.paging.util.SearchVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAOImpl memDAO;
	
	//1. 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		System.out.println("会員登録　service　始まり");
		memDAO.insertMember(vo);
		System.out.println("会員登録　service　完了");
	}

	//2. 회원삭제(탈퇴)
	@Override
	public void unregister(MemberVO vo) throws Exception {
		System.out.println("会員脱退　service　始まり");
		memDAO.deleteMember(vo);
		System.out.println("会員脱退　service　完了");
	}
	
	//3. 회원전체목록
	@Override
	public List<MemberVO> getAllUsers() throws Exception {
		System.out.println("会員リスト　service　始まり");
		List<MemberVO> list = memDAO.selectAll();
		System.out.println("会員リスト　service　完了");
		return list;
	}
	
	//4. 회원상세정보
	@Override
	public MemberVO getOneUser(String mId) throws Exception {
		System.out.println("会員詳細照会　service　始まり");
		MemberVO vo = memDAO.findById(mId);
		System.out.println("会員詳細照会　service　完了");
		return vo;
	}

	//5. 회원정보수정(사용자, 비밀번호변경 불가)
	@Override
	public void modifyInfo(MemberVO vo) throws Exception {
		System.out.println("会員情報修正　service　始まり(ユーザー)");
		memDAO.updateMember(vo);
		System.out.println("会員情報修正　service　完了(ユーザー)");
	}
	
	//5-1. 회원정보수정(관리자, 비밀번호변경까지가능)
	@Override
	public void modifyInfoByAdmin(MemberVO vo) throws Exception {
		System.out.println("会員情報修正　service　始まり(管理者)");
		memDAO.updateMemberByAdmin(vo);
		System.out.println("会員情報修正　service　完了(管理者)");
	}
	
	//6. 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		System.out.println("ログイン　service　始まり");
		MemberVO loginuser = memDAO.login(vo);
		System.out.println("ログイン　service　完了");
		return loginuser;
	}
	
	//7. 비밀번호 변경
	@Override
	public void modifyPass(MemberVO vo) throws Exception {
		System.out.println("パスワード変更　service　始まり");
		memDAO.updatePwd(vo);
		System.out.println("パスワード変更　service　完了");
	}
	
	//8. 아이디 찾기
	@Override
	public String findId(HashMap<String, String> hash) throws Exception {
		String id = memDAO.findId(hash);
		return id;
	}
	
	//9. 비밀번호 찾기
	@Override
	public String findPwd(HashMap<String, String> hash) throws Exception {
		System.out.println("パスワード検索　service　始まり");
		String pwd = memDAO.findPwd(hash);
		System.out.println("パスワード検索　service　完了");
		return pwd;
	}
	
	//10. 총 멤버 수
	@Override
	public int totalMember(SearchVO search) throws Exception {
		return memDAO.countAll(search);
	}
	
	//11. 페이징 처리 멤버 조회
	@Override
	public List<MemberVO> getAllUsers(SearchVO search) throws Exception {
		List<MemberVO> list = memDAO.selectAll(search);
		return list;
	}

}