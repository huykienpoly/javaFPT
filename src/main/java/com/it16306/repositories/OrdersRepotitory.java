package com.it16306.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.it16306.entity.Orders;

public interface OrdersRepotitory extends JpaRepository<Orders, Integer> {
	@Query(value = "SELECT Max(acc.id) FROM Orders acc ") 
	public int finMaxIdOrder();

	}
