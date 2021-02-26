package com.spring.member.dao;

import java.util.HashMap;
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
		System.out.println("会員登録　dao　始まり");
		sqlSession.insert("member.insert", vo);
		System.out.println("会員登録　dao　完了");
	}

	//2. 회원삭제
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		System.out.println("会員削除　dao　始まり");
		sqlSession.delete("member.delete", vo);
		System.out.println("会員削除　dao　完了");
	}
	
	//3. 회원전체목록
	@Override
	public List<MemberVO> selectAll() throws Exception {
		System.out.println("会員リストロード　dao　始まり");
		List<MemberVO> list = sqlSession.selectList("member.selectall");
		System.out.println("会員リストロード　dao　完了");
		return list;
	}
	
	//4. 회원상세정보
	@Override
	public MemberVO findById(String mId) throws Exception {
		System.out.println("会員詳細照会　dao　始まり");
		MemberVO vo = sqlSession.selectOne("member.selectOne", mId);
		System.out.println("会員詳細照会　dao　完了");
		return vo;
	}

	//5. 회원정보수정(사용자, 비밀번호변경 불가)
	@Override
	public void updateMember(MemberVO vo) throws Exception{
		System.out.println("会員修正　dao　始まり(ユーザー)");
		sqlSession.update("member.update", vo);
		System.out.println("会員修正　dao　完了(ユーザー)");
	}
	
	//5-1. 회원정보수정(관리자, 비밀번호 변경까지 가능)
	@Override
	public void updateMemberByAdmin(MemberVO vo) throws Exception{
		System.out.println("会員修正　dao　始まり(管理者)");
		sqlSession.update("member.updateByAdmin", vo);
		System.out.println("会員修正　dao　完了(管理者)");
	}

	//6. 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		System.out.println("ログイン　dao　始まり");
		MemberVO loginuser = sqlSession.selectOne("member.login", vo);
		System.out.println("ログイン　dao　完了");
		return loginuser;
	}
	
	//7. 비밀번호 변경
	public void updatePwd(MemberVO vo) throws Exception{
		System.out.println("パスワード変更　dao　始まり");
		sqlSession.update("member.updatePass", vo);
		System.out.println("パスワード変更　dao　完了");
	}
	
	//8. 아이디 찾기
	public String findId(HashMap<String, String> hash) throws Exception{
		System.out.println("ID検索　dao　始まり");
		return sqlSession.selectOne("member.findId", hash);
	}
	
	//9. 비밀번호 찾기
	public String findPwd(HashMap<String, String> hash) throws Exception{
		System.out.println("パスワード検索　dao　始まり");
		return sqlSession.selectOne("member.findPwd", hash);
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