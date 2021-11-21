package com.kh.spring.price.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("price")
public class PriceController {

	@GetMapping("index")
	public void index() {}
	
	@GetMapping("price-spec")
	public void priceSpec() {}
}
