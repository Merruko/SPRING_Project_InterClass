package com.spring.notice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.notice.domain.NoticeVO;

public class NoticeMapper implements RowMapper<NoticeVO> {
	
	public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		NoticeVO board = new NoticeVO();
		board.setSeq(rs.getInt("SEQ"));
		board.setTitle(rs.getString("TITLE"));
		board.setWriter(rs.getString("WRITER"));
		board.setContent(rs.getString("CONTENT"));
		board.setRegDate(rs.getDate("REGDATE"));
		board.setCnt(rs.getInt("CNT"));
		return board;
		
	}
	
}