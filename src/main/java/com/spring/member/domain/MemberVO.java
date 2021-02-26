package com.spring.member.domain;

import javax.persistence.Entity;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
public class MemberVO {
	
	private int mNum;
	
	@Size(min=4, max=16, message="IDは4~16個の文字で成り立たなければなりません。")
	@Pattern(regexp = "[a-z0-9]*", message="アルファベットの小文字と数字のみ入力できます。")
	private String mId;
	
	@Size(min=4, max=16, message="パスワードは4~16個の文字で成り立つ必要があります。")
	@Pattern(regexp="[(?=^.{4,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=])]*", message="空白は入力できません。")
	private String mPwd;
	
	@Size(min=2, max=4, message="名前は2~4文字で構成されたハングルのみ使用できます。")
	@Pattern(regexp = "[가-힣]*", message="ハングル以外の文字は使用できません。")
	private String mName;
	
	private String mGender;
	
	@Size(min=6, max=6, message="入力した生年月日の様式を確認してください。")
	@Pattern(regexp = "[0-9]*", message="数字のみ入力してください。")
	private String mBirth;
	
	@NotEmpty(message="Emailを入力してください。")
	@Email
	private String mEmail;
	
	@Size(min=11, max=11, message="入力した番号の様式を確認してください。")
	@Pattern(regexp = "[0-9]*", message="単に数字のみで構成される必要があります。")
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