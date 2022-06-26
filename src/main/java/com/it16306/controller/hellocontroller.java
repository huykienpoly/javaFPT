package com.it16306.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it16306.beans.User;
import com.it16306.demo_bean_config.UserDAOInterface;

@Controller
public class hellocontroller {

	
	
	@Autowired
	private User user;
	
	@Autowired
	@Qualifier("user_dao_sqlserver")
	private UserDAOInterface dao;

	@GetMapping("hello")
	public String hello(
		Model model,
		@RequestParam(
			name="ho_ten",
			defaultValue="IT16306"
		) String hoTen
	) {
		System.out.println("hellocontroller@hello");
		model.addAttribute("message", hoTen);
		return "hello";
	}

	@GetMapping("demo-bean")
	@ResponseBody
	public String demoBean()
	{
		this.dao.insert(user);
		this.dao.update(user);
		this.dao.delete(user);
		this.dao.all();
		return "hello, " + this.user.getHoTen();
	}

}
