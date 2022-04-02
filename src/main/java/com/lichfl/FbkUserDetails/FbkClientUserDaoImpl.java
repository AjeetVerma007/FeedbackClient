package com.lichfl.FbkUserDetails;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("FbkClientUserDao")
public class FbkClientUserDaoImpl implements FbkClientUserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MessageSource messageSource;

	
	@Override
	@Transactional(transactionManager="txManager", readOnly=true)
	public FbkUserRole getUserRoles(String username) {
		System.out.println("input user id :"+username);
		String query = messageSource.getMessage("userRoles", null, Locale.ENGLISH);
		return  jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(FbkUserRole.class),username);
	}

}
