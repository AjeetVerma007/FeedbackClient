package com.lichfl.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class FbkClientSecurityInitializer extends  AbstractSecurityWebApplicationInitializer {

	@Override
	protected boolean enableHttpSessionEventPublisher() {
		return true;
	}
}