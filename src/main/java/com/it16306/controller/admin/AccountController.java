package com.it16306.controller.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import com.it16306.Utils.HashUtil;
import com.it16306.beans.AccountModel;
import com.it16306.entity.Accounts;

import com.it16306.repositories.AccountRepository;



@Controller
@RequestMapping("/admin/accounts")
public class AccountController {
	@Autowired
	private AccountRepository accountRepo;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/create")
	public String create(@ModelAttribute("account") AccountModel acc) {
		return "admin/accounts/create";
	}

	@PostMapping("/store")
	public String store(AccountModel model) {
		Accounts acc = new Accounts();
		acc.setFullname(model.getFullname());
		acc.setUsername(model.getUsername());
		acc.setEmail(model.getEmail());
		acc.setPassword(model.getPassword());
		acc.setPhoto(model.getPhoto());
		acc.setAdmin(model.getAdmin());
		acc.setActivated(0);
		String hashedPassword = HashUtil.hash(acc.getPassword());
		acc.setPassword(hashedPassword);
		
		this.accountRepo.save(acc);
		

		return "redirect:/admin/accounts/index";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Accounts accounts) {
		System.out.println(accounts.getEmail());
		this.accountRepo.delete(accounts);
		return "redirect:/admin/accounts/index";
	}

	@GetMapping("index")
	
	public String index(Model model,
			@RequestParam(name="size", defaultValue="2") Integer size,
			@RequestParam(name="page", defaultValue="0") Integer page ){
		Pageable pageable = PageRequest.of(page, size);
		
		Page<Accounts> p = this.accountRepo.findAll(pageable);
		model.addAttribute("data", p);
		model.addAttribute("dataa", p);
		return "admin/accounts/index";
	}

	@GetMapping(value = "/edit/{id}")
	public String edit(Model model, @PathVariable("id") Accounts accou) {

		model.addAttribute("accou", accou);
		return "admin/accounts/edit";
	}

	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Accounts accou, AccountModel accountModel ) {
		Integer idInteger = accou.getId();
		String fullnameString = accountModel.getFullname();
		String usernameString = accountModel.getUsername();
		String emailString = accountModel.getEmail();
		String photoString = accountModel.getPhoto();
		String passwordString = accountModel.getPassword();
		Integer active  = accountModel.getActivated();
		Integer adminInteger = accountModel.getAdmin();
		Accounts account = new Accounts();
		account.setFullname(fullnameString);
		account.setUsername(usernameString);
		account.setEmail(emailString);
		account.setPhoto(photoString);
		account.setPassword(passwordString);
		account.setAdmin(adminInteger);
		account.setActivated(active);
		account.setId(idInteger);
		this.accountRepo.save(account);
		return "redirect:/admin/accounts/index";
	}
}