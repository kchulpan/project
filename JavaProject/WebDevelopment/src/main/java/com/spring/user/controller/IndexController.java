package com.spring.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/regmember")
	public String regMember() {
		return "client/signUp";
	}
	
	//테스트입니다
	@RequestMapping("/excel")
	public String excel() {
		return "/excel/excel";
	}
}
