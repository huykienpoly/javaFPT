package com.it16306.demo_bean_config;

import com.it16306.beans.User;

public interface UserDAOInterface {
	public void insert(User u);
	public void update(User u);
	public void delete(User u);
	public void all();
}
