package com.it16306.controller.admin;


import java.util.Date;
import java.util.List;




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

import com.it16306.beans.OrderdetailModel;
import com.it16306.beans.OrdersModel;
import com.it16306.entity.Accounts;
import com.it16306.entity.Orders;
import com.it16306.entity.Products;
import com.it16306.entity.order_details;
import com.it16306.repositories.AccountRepository;
import com.it16306.repositories.OrderdetailRespository;
import com.it16306.repositories.OrdersRepotitory;
import com.it16306.repositories.ProductRepository;

@Controller
@RequestMapping("/admin/order_detail")
public class OrderdetailController {
	
	@Autowired
	private OrderdetailRespository orderDeatailRepo;
	
	@Autowired
	private ProductRepository proRepo;

	
	@Autowired
	private OrdersRepotitory orderRepo;
	@Autowired
	private AccountRepository accRepository;

	
	@GetMapping("/index_detail")
	public String index(Model model, @RequestParam(name = "size", defaultValue = "6") Integer size,
			@RequestParam(name = "page", defaultValue = "0") Integer page,
			@ModelAttribute("oder") OrdersModel oder,
			@ModelAttribute("orderDetail") OrderdetailModel orderDetail) {

		Pageable pageable = PageRequest.of(page, size);
		System.out.println(pageable);
		Page<Products> p = this.proRepo.findAll(pageable);
		model.addAttribute("data", p);
		List<order_details> lod=this.orderDeatailRepo.finODetailbyOderId(0);
		if(lod.size()>0) {
		model.addAttribute("dataa",lod);
		double thanhtien =0;
		for (order_details orderDetails : lod) {
			thanhtien += orderDetails.getPrice();
		}
		model.addAttribute("thanhtien",thanhtien);
		}
		return "admin/order_detail/home_detail";

	}
	
	@PostMapping("/store/{id}")
	public String store(
		@PathVariable("id") Products product,
		order_details oderdetail
	) 
	{		
		order_details check = this.orderDeatailRepo.findbyOrderdetail(0, product.getId());
		
		
		if(check == null) {
			order_details od = new order_details();
			od.setPrice(product.getPrice()*oderdetail.getQuantity());
			od.setQuantity(oderdetail.getQuantity());
			od.setProduct(product);
			od.setOrderId(0);
			
			this.orderDeatailRepo.save(od);
		}else {
			order_details od = new order_details();
			od.setPrice(product.getPrice()*oderdetail.getQuantity());
			od.setQuantity(check.getQuantity() + oderdetail.getQuantity());
			od.setProduct(product);
			od.setOrderId(0);
			od.setId(check.getId());
			
			this.orderDeatailRepo.save(od);
		}
		
		
		return "redirect:/admin/order_detail/index_detail";
	}
	
	
	@PostMapping("add")
	public String add(OrdersModel oder) {
		List<order_details> lod=this.orderDeatailRepo.finODetailbyOderId(0);
		int idstr= this.orderRepo.finMaxIdOrder();
		int idadd=idstr+1;
		
		Accounts acc = this.accRepository.findbyid(1);
		
		Orders o = new Orders();
		o.setAddress(oder.getAddress());
		o.setUser(acc);
		o.setCreatedDate(oder.getCreatedDate());
		
		
		for (order_details orderDetails : lod) {
			orderDetails.setOrderId(idadd);
			this.orderDeatailRepo.save(orderDetails);
		}
		this.orderRepo.save(o);
		return "redirect:/admin/order_detail/index_detail";
	}
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") order_details orderdetail)
	{
		this.orderDeatailRepo.delete(orderdetail);

		return "redirect:/admin/order_detail/index_detail";
	}
	@PostMapping("/update/{id}")
	public String update(
		@PathVariable("id") Products product,
		order_details oderdetail
	) 
	{		
		order_details check = this.orderDeatailRepo.findbyOrderdetail(0, product.getId());
		
		
			order_details od = new order_details();
			od.setPrice(product.getPrice()*oderdetail.getQuantity());
			od.setQuantity( oderdetail.getQuantity());
			od.setProduct(product);
			od.setOrderId(0);
			od.setId(check.getId());
			
			this.orderDeatailRepo.save(od);
		
		
		
		return "redirect:/admin/order_detail/index_detail";
	}
	


	
	
	
}
