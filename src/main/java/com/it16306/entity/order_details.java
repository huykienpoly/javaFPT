

package com.it16306.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="order_details")
public class order_details {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="order_id")
	private int orderId;

	@ManyToOne
	@JoinColumn(name="product_id")
	private Products product;
	
	@Column(name="price")
	private double price;
	
	@Column(name="quantity")
	private int quantity;
}