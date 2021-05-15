package com.sc.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.it.service.SuSooUserService;
import com.sc.it.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserRestController {

	@Autowired
	private SuSooUserService service;
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(String s_id) {
		UserVO user = service.checkID(s_id);
		boolean check = user != null ? true : false;
		System.out.println(s_id);
		return check;
	}
}
