package com.it16306.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.it16306.entity.Categories;
import com.it16306.entity.Products;

public interface ProductRepository extends JpaRepository<Products, Integer> {

}
