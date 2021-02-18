package com.spring.notice.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "boardList")
@XmlAccessorType(XmlAccessType.FIELD)
public class NoticeListVO {
	@XmlElement(name = "board")
	private List<NoticeVO> boardList;

	public List<NoticeVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<NoticeVO> boardList) {
		this.boardList = boardList;
	}
}