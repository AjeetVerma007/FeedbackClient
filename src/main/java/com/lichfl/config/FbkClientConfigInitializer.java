package com.lichfl.config;

import java.io.File;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


@ComponentScan(basePackages = "com.lichfl")
@Configuration
public class FbkClientConfigInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] { FbkClientAsyncConfig.class, FbkClientConfig.class, 
				FbkClientWebMvcConfig.class,
				FbkClientSecurityInitializer.class,
				FbkClientSecurityConfig.class };

	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class<?>[] { FbkClientWebMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] { "/" };
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		super.customizeRegistration(registration);
		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
        // upload temporary file will put here
        File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));
        // register a MultipartConfigElement
        MultipartConfigElement multipartConfigElement =
                new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
                		getMaxUploadSize(), getMaxUploadSize() * 2, getMaxUploadSize() / 2);
        registration.setMultipartConfig(multipartConfigElement);
	}
	
	private int getMaxUploadSize() {
		return 5 * 1024 * 1024; //5MB
	}

}
