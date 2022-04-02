package com.lichfl.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.ldap.userdetails.InetOrgPerson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lichfl.FbkUserDetails.FbkClientUserDao;
import com.lichfl.FbkUserDetails.FbkUserRole;
import com.lichfl.model.Query;
import com.lichfl.service.FbkClientService;

@Controller
public class FbkClientController {

    @Autowired
	FbkClientService fbkClientService;
    
	private final static String OPEN = "open";
	private final static String CLOSED = "closed";
	
	
	@Autowired
	private FbkClientUserDao fbkClientUserDao;
	private static Logger LOG = LoggerFactory.getLogger(FbkClientController.class);


	@RequestMapping(value="/")
	public String app(Model model,HttpServletRequest request) {
		String fwdServletPath = String.valueOf(request.getAttribute(RequestDispatcher.FORWARD_SERVLET_PATH));
         System.out.println("servlet Path :"+ fwdServletPath);
		model.addAttribute("dummy", new Object());
		return "login";
	}
	
	@RequestMapping(value="/welcome")
	public String loadApp(Model model,HttpServletRequest request) {
		InetOrgPerson user = (InetOrgPerson) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		model.addAttribute("name", user.getDisplayName());
		model.addAttribute("username", user.getUsername());
		model.addAttribute("dummy", user);
		List<Query> queryData = fbkClientService.getQueries((String)user.getUsername(),OPEN );
		System.out.println("queryData"+queryData);
		model.addAttribute("queries",fbkClientService.getQueries(user.getUsername(),OPEN ));
		System.out.println("getDisplayName :"+user.getDisplayName() + "getUsername()"+user.getUsername());
		return "welcome";
	}
	
	
	@RequestMapping(value = "/admin")
	public String loadAdminPanel(Model model,HttpServletRequest request)
	{
	InetOrgPerson user = (InetOrgPerson) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	LOG.info("User details :", user.getUsername());
	String fwdServletPath = String.valueOf(request.getAttribute(RequestDispatcher.FORWARD_SERVLET_PATH));
    System.out.println("servlet Path for admin  :"+ fwdServletPath);

	
	FbkUserRole fbkUserRole;
	try {
		fbkUserRole = fbkClientUserDao.getUserRoles((String)user.getUsername());
		System.out.println("fbkUserRole"+ fbkUserRole);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return "error";
	}
		
		if(fbkUserRole==null)
		{
			return "error";
		}
	
		else 
		{
			return "admin";
		}
		
	}
//	private static Logger LOG = LoggerFactory.getLogger(FbkClientController.class);

}
