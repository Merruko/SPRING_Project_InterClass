package com.spring.proj.service;

import java.util.List;

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

}
