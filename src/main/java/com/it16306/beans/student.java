package com.it16306.beans;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class student {
	String name;
	String email;
	Double marks;
	Boolean gender;
	String faculty;
	List<String>hobbies;

}
