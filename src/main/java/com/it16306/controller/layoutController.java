package com.it16306.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class layoutController {
	@GetMapping("layout")
	public String getlogin() {
		
		return "layout";
		
	}
}
