package com.it16306.beans;



import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountModel {

	@NotNull
	@NotBlank
	private String username;
	@NotNull
	@NotBlank
	private String password;
	@NotNull
	@NotBlank
	private String fullname;
	@NotNull
	@NotBlank
	@Email
	private String email;
	@NotNull
	@NotBlank
	private String photo;
	@NotNull
	
	private int admin;
	@NotNull
	private int activated;
}