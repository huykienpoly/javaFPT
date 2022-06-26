package com.it16306.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.it16306.Utils.HashUtil;
import com.it16306.entity.Accounts;
import com.it16306.repositories.AccountRepository;

@Controller

public class LoginController {
	
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/login")
	public String login( Model model) {
		return "admin/Logins/login";
	}
	@PostMapping("/login")
	public String login(
		@RequestParam("email") String email,
		@RequestParam("password") String password
	) {
		Accounts entity = this.accRepo.findByEmail(email);
		HttpSession session = request.getSession();
		if (entity == null) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");
			return "/admin/Logins/login";
		}

		boolean checkPwd = HashUtil.verify(password, entity.getPassword());
		if (!checkPwd) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");
			return "/admin/Logins/login";
		}
		
		session.setAttribute("account", entity);
		return "redirect:/layout";
	}


}

