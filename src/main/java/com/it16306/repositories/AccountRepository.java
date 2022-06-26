package com.it16306.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it16306.entity.Accounts;

public  interface AccountRepository extends JpaRepository<Accounts, Integer> {
	@Query("SELECT entity FROM Accounts entity WHERE email=:email")
	public Accounts findByEmail(@Param("email") String email);
	@Query(value = "SELECT acc FROM Accounts acc WHERE acc.id = :id ") 
	public Accounts findbyid(@Param("id") int id);

}
