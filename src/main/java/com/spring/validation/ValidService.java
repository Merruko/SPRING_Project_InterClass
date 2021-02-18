package com.spring.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ValidService {
	
	@Autowired
	ValidDAO userDAO;
	
	//아이디 중복검사
	public boolean checkUserIdExist(String mId) {
		System.out.println("아이디 중복검사 중(service)");
		
		String result = userDAO.checkId(mId);
		
		if(result == null) {
			return true; //sql문에서 값을 찾지 못하면(=null) 아이디 중복X, 사용가능(true)
		} else {
			return false; //null이 아니라면 이미 DB에 존재하는 아이디 --> 중복O 사용불가능(false)
		}
	}
}
