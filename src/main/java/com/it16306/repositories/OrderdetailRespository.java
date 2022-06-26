package com.it16306.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it16306.entity.order_details;

public interface OrderdetailRespository extends JpaRepository<order_details, Integer> {
	@Query(value = "SELECT acc FROM order_details acc WHERE acc.orderId = :id AND acc.product.id = :id2 ") 
	public order_details findbyOrderdetail(@Param("id") int id,@Param("id2") int id2);
	
	@Query(value = "SELECT acc FROM order_details acc WHERE acc.orderId = :id ") 
	public List<order_details> finODetailbyOderId(@Param("id") int id);
}
