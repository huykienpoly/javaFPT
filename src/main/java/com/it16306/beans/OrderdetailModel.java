package com.it16306.beans;



import com.it16306.entity.Orders;
import com.it16306.entity.Products;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderdetailModel {
	
	private Orders order;
	
	private Products product;
	
	private double price;
	
	private int quantity;
}