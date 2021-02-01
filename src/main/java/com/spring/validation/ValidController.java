package com.spring.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ValidController {

		@Autowired
		private ValidService userSVC;
		
		@GetMapping("/signUp/duplicatedId/{mId}")
		public String duplicatedId(@PathVariable String mId) {
			boolean check = userSVC.checkUserIdExist(mId);
			
			return check + "";
		}
}
