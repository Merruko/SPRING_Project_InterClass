package com.spring.member.domain;

import javax.persistence.Entity;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Entity
public class MemberVO {
	
	private int mNum;
	
	@Size(min=4, max=16, message="아이디는 4~16개의 문자로 이루어져야합니다.")
	@Pattern(regexp = "[a-z0-9]*", message="알파벳 소문자와 숫자만 입력할 수 있습니다.")
	private String mId;
	
	@Size(min=4, max=16, message="비밀번호는 4~16개의 문자로 이루어져야합니다.")
	@Pattern(regexp="[(?=^.{4,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=])]*", message="공백은 입력할 수 없습니다.")
	private String mPwd;
	
	@Size(min=2, max=4, message="이름은 2~4자로 이루어진 한글만 사용할 수 있습니다.")
	@Pattern(regexp = "[가-힣]*", message="한글이외의 문자는 사용하실 수 없습니다.")
	private String mName;
	
	private String mGender;
	
	@Size(min=6, max=6, message="입력한 생년월일의 양식을 확인해주십시오.")
	@Pattern(regexp = "[0-9]*", message="숫자만 입력해주세요.")
	private String mBirth;
	
	@NotEmpty(message="이메일을 입력해주세요.")
	@Email
	private String mEmail;
	
	@Size(min=11, max=11, message="입력한 전화번호의 양식을 확인해주십시오.")
	@Pattern(regexp = "[0-9]*", message="오직 숫자로만 구성되어야 합니다.")
	private String mPhone;
	
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	
}
