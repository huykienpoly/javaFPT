package com.it16306.controller.admin;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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
import com.it16306.beans.ProductsModel;
import com.it16306.entity.Accounts;
import com.it16306.entity.Categories;
import com.it16306.entity.Products;
import com.it16306.repositories.AccountRepository;
import com.it16306.repositories.CategoriesRepository;
import com.it16306.repositories.ProductRepository;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private CategoriesRepository cateRepo;
	@Autowired
	private HttpServletRequest request;
	@GetMapping("/create_pro")
	public String create(@ModelAttribute("product") ProductsModel pro,Model model) {
		List<Categories> list = this.cateRepo.findAll();
		model.addAttribute("dsCate", list);
		return "admin/products/create_pro";
	}

	@PostMapping("store")
	public String store(  ProductsModel model) {
		Products pro = new Products();
		pro.setName(model.getName());
		pro.setImage(model.getImage());
		pro.setPrice(model.getPrice());
		pro.setAvailable(model.getAvailable());
		

		int idStr = model.getCategory().getId();
		System.out.println(idStr);
		Categories cate = this.cateRepo.findById(idStr).get();
		pro.setCategory(cate);;
		
		pro.setCreatedDate(model.getCreatedDate());

		this.productRepo.save(pro);
		return "redirect:/admin/products/index_pro";
	}
	@GetMapping("/index_pro")
	public String index(
		Model model,
		
		@RequestParam(name="page", defaultValue="0") Integer page
	) {
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = ( sortDirection == null || sortDirection.equals("asc") ) ?
			Sort.by(Direction.ASC, sortField):
			Sort.by(Direction.DESC, sortField);

	
		int limit = limitParam == null ? 3 : Integer.parseInt(limitParam);
		
		Pageable pageable = PageRequest.of(page, limit, sort);
		Page<Products> p = this.productRepo.findAll(pageable);
		model.addAttribute("data", p);
		List<Products> pro = this.productRepo.findAll();
		model.addAttribute("dsPro", pro);
		return "admin/products/index_pro";
	}
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Products pro) {
	
		this.productRepo.delete(pro);
		return "redirect:/admin/products/index_pro";
	}
	@GetMapping(value="/edit_pro/{id}")
	public String edit(
		Model model,
		@PathVariable("id") Products pro
	) {
		List<Categories> list = this.cateRepo.findAll();
		model.addAttribute("cate", list);
		
		model.addAttribute("pro", pro);
		return "admin/products/edit_pro";
	}
	@PostMapping("/update/{id}")
	public String update(@Valid @PathVariable("id") Products pros, ProductsModel proModel ) {
		System.out.println("------------------------------------------------------------------------");
		Integer idStr = pros.getId();
		System.out.println(idStr);
		String nameStr = proModel.getName();
		String imgStr = proModel.getImage();
		Double priceStr = proModel.getPrice();
		Integer avaiStr = proModel.getAvailable();

		Products pr = this.productRepo.findById(idStr).get();
		Categories cate = proModel.getCategory();
		
		Products pro = new Products();
		pro.setId(idStr);
		pro.setName(nameStr);
		pro.setImage(imgStr);
		pro.setPrice(priceStr);
		pro.setAvailable(avaiStr);		
		pro.setCategory(cate);		
		pro.setCreatedDate(pr.getCreatedDate());

		this.productRepo.save(pro);
		return "redirect:/admin/products/index_pro";
	}
	
	
	
}
