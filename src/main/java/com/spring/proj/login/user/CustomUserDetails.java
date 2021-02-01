package com.spring.proj.login.user;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private String mId;
	private String mPwd;
	private String authority;
	private boolean enabled;

	public void setmId(String mId) {
		this.mId = mId;
	}


	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
	}
	

	public String getAuthority() {
		return authority;
	}

	@Override
	public String getUsername() {
		return mId;
	}
	
	@Override
	public String getPassword() {
		return mPwd;
	}
	
	//계정이 만료되었는가? 정상-true 만료-false
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	
	//계정이 잠기지 않았는가? 정상-true 잠김-false
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//패스워드가 만료되지 않았는가? 정상-true 만료-false
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	//계정이 활성화 되었는가? 정상-true 비활성화-false
	@Override
	public boolean isEnabled() {
		return enabled;
	}

}
