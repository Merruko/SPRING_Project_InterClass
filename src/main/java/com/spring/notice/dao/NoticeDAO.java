package com.spring.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.member.domain.MemberVO;
import com.spring.notice.common.JDBCUtil;
import com.spring.notice.domain.NoticeVO;
import com.spring.paging.util.PagingVO;
import com.spring.paging.util.SearchVO;

@Repository("boardDAO")
public class NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String BOARD_INSERT = "INSERT INTO I_NOTICE (SEQ, TITLE, WRITER, CONTENT, REGDATE) VALUES((SELECT nvl(max(seq), 0)+1 FROM I_NOTICE),?,?,?, SYSDATE)";
	private final String BOARD_UPDATE = "UPDATE I_NOTICE SET TITLE=?, CONTENT=? WHERE SEQ=?";
	private final String BOARD_DELETE = "DELETE I_NOTICE WHERE SEQ=?";
	private final String BOARD_GET = "SELECT * FROM I_NOTICE WHERE SEQ=?";
	
	// 글 등록
	public void insertBoard(NoticeVO vo) {
		System.out.println("insertBoard() 実行");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			System.out.println("000: "+vo.getTitle()+" || "+vo.getWriter()+" || "+vo.getContent());
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateBoard(NoticeVO vo) {
		System.out.println("updateBoard() 実行");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteBoard(NoticeVO vo) {
		System.out.println("deleteBoard() 実行");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회
	public NoticeVO getBoard(NoticeVO vo) {
		System.out.println("getBoard() 実行");
		NoticeVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			if (rs.next()) {
				board = new NoticeVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}

	// 글 목록 조회
	public List<NoticeVO> getBoardList(PagingVO pagination) {
		System.out.println("getBoardList() 実行");
		return sqlSession.selectList("paging.selectNoticeAll", pagination);
	}
	
	// 조회수 증가
	public void updateCnt(int seq) {
		sqlSession.update("notice.plusCnt", seq);
	}
	
	// 총 게시글 개수 확인
	public int getNoticeListCnt(SearchVO search) throws Exception{
		return sqlSession.selectOne("paging.countNotice", search);
	}
	
}