package com.heatokpia.controller;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

@Controller
@RequestMapping("/finance")
@RequiredArgsConstructor
public class financeController {

	@GetMapping()
	public ModelAndView searchForm() {
		ModelAndView model = new ModelAndView("finance/financeSearch");
		
		
		
		return model;
	}
	
	@PostMapping()
	public @ResponseBody ResponseEntity<?> searchResult(@RequestParam("name") String name){
		Stock stock;
		try {
			stock = YahooFinance.get(name);
			BigDecimal price = stock.getQuote().getPrice();
			return new ResponseEntity<>(price, HttpStatus.OK);
		} catch (IOException e) {
			return new ResponseEntity<>("결과 없음", HttpStatus.BAD_REQUEST);
		}
	}
}
