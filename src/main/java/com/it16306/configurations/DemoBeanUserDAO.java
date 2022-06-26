package com.it16306.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.it16306.demo_bean_config.UserDAOInterface;
import com.it16306.demo_bean_config.UserDAOMySql;
import com.it16306.demo_bean_config.UserDAOSqlServer;

@Configuration
public class DemoBeanUserDAO {
	@Bean("user_dao_mysql")
	public UserDAOInterface getUserDAOMySql()
	{
		return new UserDAOMySql();
	}
	
	@Bean("user_dao_sqlserver")
	public UserDAOInterface getUserDAOSqlServer()
	{
		return new UserDAOSqlServer();
	}
}
