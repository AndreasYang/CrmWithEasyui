package com.situ.crm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.crm.pojo.User;
import com.situ.crm.service.IUserService;

@Controller
@RequestMapping("/index")
public class indexController {
	@Autowired
	IUserService userService;
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(String name, String password, HttpServletRequest request){
		User user = userService.findUserByNameAndPassword(name, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println(user);
			return "redirect:/index/index.action";
		}else {
			return "";
		}
	}
}
