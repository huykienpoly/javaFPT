package com.it16306.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.it16306.entity.Accounts;
import com.it16306.entity.Categories;

public interface CategoriesRepository extends JpaRepository<Categories, Integer> {

}
