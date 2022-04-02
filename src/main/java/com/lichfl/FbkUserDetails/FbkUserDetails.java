package com.lichfl.FbkUserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class FbkUserDetails implements UserDetails {

	/**
	 * 
	 * @author 70766
	 */
	@Autowired
	private FbkUserRole fbkUserRole;
	private static final long serialVersionUID = 1L;
	private static Logger LOG = LoggerFactory.getLogger(FbkUserDetails.class);

	

	public FbkUserDetails(FbkUserRole fbkUserRole) {
		 this.fbkUserRole= fbkUserRole;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		List<String> roles = fbkUserRole.getRole();
		
		LOG.info("Class - FbkUserDetails , roles fetched  - " + roles);
		
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
