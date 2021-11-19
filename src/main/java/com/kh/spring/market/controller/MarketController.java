package com.kh.spring.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("market")
public class MarketController {

	@GetMapping("index")
	public String index() {
		return "/market/market";
	}
	
}
