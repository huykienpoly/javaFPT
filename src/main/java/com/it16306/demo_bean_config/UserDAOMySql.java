package com.it16306.demo_bean_config;

import com.it16306.beans.User;

public class UserDAOMySql implements UserDAOInterface {
	@Override
	public void insert(User u) {
		System.out.println("Them MySql");
	}

	@Override
	public void update(User u) {
		System.out.println("Cap nhat MySql");
	}

	@Override
	public void delete(User u) {
		System.out.println("Xoa MySql");
	}

	@Override
	public void all() {
		System.out.println("All MySql");
	}

}
