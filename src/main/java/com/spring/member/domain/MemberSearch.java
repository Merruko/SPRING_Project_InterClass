package com.spring.member.domain;

import com.spring.paging.util.PagingVO;

public class MemberSearch extends PagingVO {
	
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}