package com.it16306.controller.admin;

import java.util.List;

import javax.validation.Valid;

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

import com.it16306.beans.OrdersModel;
import com.it16306.beans.ProductsModel;
import com.it16306.entity.Accounts;
import com.it16306.entity.Categories;
import com.it16306.entity.Orders;
import com.it16306.entity.Products;
import com.it16306.repositories.AccountRepository;
import com.it16306.repositories.OrdersRepotitory;

@Controller
@RequestMapping("admin/orders")

public class OdersController {
	@Autowired
	private OrdersRepotitory orderRepo;
	
	@Autowired
	private AccountRepository accrepo;
	
	
	@GetMapping("/create_ord")
	public String create(@ModelAttribute("order") Orders order, Model model) {
		List<Accounts> acc = this.accrepo.findAll();
		model.addAttribute("dsAcc",acc);
		return "/admin/orders/create_ord";
	}
	
	
	@PostMapping("/store")
	public String store(OrdersModel model) {
		Orders order = new Orders();
		order.setCreatedDate(model.getCreatedDate());
		order.setAddress(model.getAddress());
		int idStr = model.getUser().getId();
		Accounts acc = this.accrepo.findById(idStr).get();
		order.setUser(acc);
		this.orderRepo.save(order);
		return "redirect:/admin/orders/index_ord";
	}
	@GetMapping("/index_ord")
	public String index(
		Model model,
		@RequestParam(name="size", defaultValue="2") Integer size,
		@RequestParam(name="page", defaultValue="0") Integer page
	) {
		Pageable pageable = PageRequest.of(page, size);
		System.out.println(pageable);
		Page<Orders> p = this.orderRepo.findAll(pageable);
		model.addAttribute("data", p);
		return "admin/orders/index_ord";
	}
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Orders order ) {
	
		this.orderRepo.delete(order);
		return  "redirect:/admin/orders/index_ord";
	}
	@GetMapping(value="/edit_ord/{id}")
	public String edit(
		Model model,
		@PathVariable("id")  Orders order
	) {
		List<Orders> list = this.orderRepo.findAll();
		model.addAttribute("cate", list);
		
		model.addAttribute("order", order);
		List<Accounts> lis = this.accrepo.findAll();
		model.addAttribute("dsAcc", list);
		model.addAttribute("order", order);
		return "admin/orders/edit_ord";
	}
	@PostMapping("/update/{id}")
	public String update(@Valid @PathVariable("id") Orders  order , OrdersModel ordModel ) {
		System.out.println("------------------------------------------------------------------------");
		Integer idStr = order.getId();
		
		String addressStr = ordModel.getAddress();
		Accounts acc = ordModel.getUser();
		Orders odrers = this.orderRepo.findById(idStr).get();
		Orders ord= new Orders();
		ord.setId(idStr);
		ord.setUser(acc);
		ord.setAddress(addressStr);
		ord.setCreatedDate(odrers.getCreatedDate());
		this.orderRepo.save(ord);
		
	
		
		return "redirect:/admin/orders/index_ord";
	}
	
	
	
	


}
