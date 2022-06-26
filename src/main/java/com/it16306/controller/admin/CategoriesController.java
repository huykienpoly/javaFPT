package com.it16306.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it16306.beans.AccountModel;
import com.it16306.beans.CategoriesModel;
import com.it16306.entity.Accounts;
import com.it16306.entity.Categories;
import com.it16306.repositories.AccountRepository;
import com.it16306.repositories.CategoriesRepository;
@Controller
@RequestMapping("/admin/categories")
public class CategoriesController {
	@Autowired
	private CategoriesRepository cateRpo;
	@GetMapping("/create")
	public String create(@ModelAttribute("categories") CategoriesModel cate)
	{
		return "admin/categories/create";
	}
	@PostMapping("/store")
	public String store(CategoriesModel model)
	{
		Categories cat = new Categories();
		cat.setName(model.getName());
		this.cateRpo.save(cat);
		return "redirect:/admin/categories/index";
		
	}
	@GetMapping("index")
	public String index(Model model,
			@RequestParam(name="size", defaultValue="2") Integer size,
			@RequestParam(name="page", defaultValue="0") Integer page) 
	{
		Pageable pageable =  PageRequest.of(page, size);
		Page<Categories> p = this.cateRpo.findAll(pageable);
		model.addAttribute("data", p);
		return "admin/categories/index";
	}
	@GetMapping(value="/edit/{id}")
	public String edit(
		Model model,
		@PathVariable("id") Categories catego
	) {
		
		model.addAttribute("catego", catego);
		return "admin/categories/edit";
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Categories catego, CategoriesModel cateModel ) {
		Integer idInteger = catego.getId();
		String nameStr = cateModel.getName();
		Categories category = new Categories();
		category.setId(idInteger);
		category.setName(nameStr);
		this.cateRpo.save(category);
		return "redirect:/admin/categories/index";
	}
	@GetMapping("delete/{id}")
	public String delete( @PathVariable("id")  Categories cats)
	{
		
		this.cateRpo.delete(cats);
		return "redirect:/admin/categories/index";
	}

	
}
