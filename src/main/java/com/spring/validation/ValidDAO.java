package com.spring.validation;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ValidDAO {
	
	@Inject
	private SqlSession sql;
	
	//아이디 중복검사
	public String checkId(String id) {
		String id_ck = sql.selectOne("validCheck.id", id);
		System.out.println("아이디 중복검사 중(dao)");
		return id_ck;
	}
	
}