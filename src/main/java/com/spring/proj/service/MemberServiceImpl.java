package com.spring.proj.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.proj.dao.MemberDAOImpl;
import com.spring.proj.domain.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAOImpl memDAO;
	
	//1. 회원가입
	@Override
	public void register(MemberVO vo) {
		System.out.println("회원가입 service 시작");
		memDAO.insertMember(vo);
		System.out.println("회원가입 service 완료");
	}

	//2. 회원삭제(탈퇴)
	@Override
	public void unregister(MemberVO vo) {
		System.out.println("회원탈퇴 service 시작");
		memDAO.deleteMember(vo);
		System.out.println("회원탈퇴 service 완료");
		
	}
	
	//3. 회원전체목록
	@Override
	public List<MemberVO> getAllUsers() {
		System.out.println("회원목록 service 시작");
		List<MemberVO> list = memDAO.selectAll();
		System.out.println("회원목록 service 완료");
		return list;
	}
	
	//4. 회원상세정보
	@Override
	public MemberVO getOneUser(String mId) {
		System.out.println("회원상세조회 service 시작");
		MemberVO vo = memDAO.findById(mId);
		System.out.println("회원상세조회 service 완료");
		return vo;
	}

	//5. 회원정보수정
	@Override
	public void modifyInfo(MemberVO vo) {
		System.out.println("회원정보수정 service 시작");
		memDAO.updateMember(vo);
		System.out.println("회원정보수정 service 완료");
	}
	
	//6. 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		System.out.println("로그인 service 시작");
		MemberVO loginuser = memDAO.login(vo);
		System.out.println("로그인 service 완료");
		return loginuser;
	}
	
	//7. 아이디 찾기
	@Override
	public String findId(HttpServletResponse response, String mEmail) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = memDAO.findId(mEmail);
			
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	//8. 비밀번호 찾기
	@Override
	public String findPwd(HttpServletResponse response, String mId) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pwd = memDAO.findPwd(mId);
		
		if (pwd == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return pwd;
		}
	}

}