package com.sc.it.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sc.it.dao.SuSooUserDAO;
import com.sc.it.vo.UserVO;

@Service
public class SuSooUserService {

	@Autowired
	private SuSooUserDAO dao;
	
	@Autowired
	private HttpSession session;
	
	// ID중복체크
	   public UserVO checkID(String s_id) {
	      return dao.checkID(s_id);
	   }
	
	// 회원가입
	public String insertUser(UserVO user) {
		int cnt = dao.insertUser(user);
		String path = cnt > 0 ? "redirect:/" : "redirect:/user/joinForm";
		return path;
	}
	
	// 로그인
	public UserVO selectUser(UserVO user) {
		return dao.selectUser(user);
		
	}
	
	// ID 찾기
	public String findId(UserVO user) {
		String list = dao.findId(user);
		return list;
	}
	
	// PW 찾기
	public String findPw(UserVO user) {
		String list = dao.findPw(user);
		return list;
	}
	
	// 회원정보 변경
	public String changeUser(UserVO user) {
		int cnt = dao.changeUser(user);
		String path = cnt > 0 ? "redirect:/" : "redirect:/user/change-userForm";
		
		return path;
	}
	
	//PW변경
	public String changePw(UserVO user) {
		int cnt = dao.changePw(user);
		String path = cnt > 0 ? "redirect:/" : "redirect:/user/change-passwordForm";
		
		return path;
		
	}
	
	
}
