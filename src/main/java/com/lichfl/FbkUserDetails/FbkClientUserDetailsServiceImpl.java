package com.lichfl.FbkUserDetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class FbkClientUserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private FbkClientUserDao fbkClientUserDao;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		FbkUserRole fbkUserRole= fbkClientUserDao.getUserRoles(username);
		
		if(fbkUserRole==null)
		{
			throw new UsernameNotFoundException("Role does not exists for the login user");
		}
	
		else 
		{
			return new FbkUserDetails(fbkUserRole);
		}
	}

}
