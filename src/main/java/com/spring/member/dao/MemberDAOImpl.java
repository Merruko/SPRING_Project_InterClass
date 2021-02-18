package com.spring.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.member.domain.MemberVO;
import com.spring.paging.util.SearchVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	//1. 회원등록
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		System.out.println("회원가입 dao 시작");
		sqlSession.insert("member.insert", vo);
		System.out.println("회원가입 dao 완료");
	}

	//2. 회원삭제
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		System.out.println("회원삭제 dao 시작");
		sqlSession.delete("member.delete", vo);
		System.out.println("회원삭제 dao 완료");
	}
	
	//3. 회원전체목록
	@Override
	public List<MemberVO> selectAll() throws Exception {
		System.out.println("회원목록 불러오기 dao");
		List<MemberVO> list = sqlSession.selectList("member.selectall");
		System.out.println("회원목록 로딩완료 dao");
		return list;
	}
	
	//4. 회원상세정보
	@Override
	public MemberVO findById(String mId) throws Exception {
		System.out.println("회원상세조회 dao 시작");
		MemberVO vo = sqlSession.selectOne("member.selectOne", mId);
		System.out.println("회원상세조회 dao 완료");
		return vo;
	}

	//5. 회원정보수정(사용자, 비밀번호변경 불가)
	@Override
	public void updateMember(MemberVO vo) throws Exception{
		System.out.println("회원수정 dao 시작");
		sqlSession.update("member.update", vo);
		System.out.println("회원수정 dao 완료");
	}
	
	//5-1. 회원정보수정(관리자, 비밀번호변경까지가능)
	@Override
	public void updateMemberByAdmin(MemberVO vo) throws Exception{
		System.out.println("회원수정 dao 시작");
		sqlSession.update("member.updateByAdmin", vo);
		System.out.println("회원수정 dao 완료");
	}

	//6. 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		System.out.println("로그인 dao 시작");
		MemberVO loginuser = sqlSession.selectOne("member.login", vo);
		System.out.println("로그인 dao 완료");
		return loginuser;
	}
	
	//7. 비밀번호변경
	public void updatePwd(MemberVO vo) throws Exception{
		System.out.println("비밀번호변경 dao 시작");
		sqlSession.update("member.updatePass", vo);
		System.out.println("비밀번호변경 dao 완료");
	}
	
	//8. 아이디 찾기
	public String findId(String mEmail) throws Exception{
		return sqlSession.selectOne("member.findId", mEmail);
	}
	
	//9. 비밀번호 찾기
	public String findPwd(String mId) throws Exception{
		return sqlSession.selectOne("member.findPwd", mId);
	}

	//10. 총 멤버 수
	@Override
	public int countAll(SearchVO search) throws Exception{
		return sqlSession.selectOne("paging.countMember", search);
	}
	
	//11. 페이징 처리 멤버 조회
	@Override
	public List<MemberVO> selectAll(SearchVO search) throws Exception{
		return sqlSession.selectList("paging.selectMemberAll", search);
	}

}