package com.sc.it.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.it.dao.SuSooWordDAO;
import com.sc.it.vo.WordVO;

@Service
public class SuSooWordService {

	@Autowired
	private SuSooWordDAO dao;
	@Autowired
	private HttpSession session;
	
	
	public ArrayList<WordVO> selectListWord(WordVO vo){
		ArrayList<WordVO> list = dao.selectListWord(vo);
		return list;
	}
	
	// 단어저장
	   public String insertWord(WordVO word) {
	      int cnt = dao.insertWord(word);
	      String path = cnt > 0 ? "redirect:/home" : "redirect:/home";
	      return path;
	   }
	
	//전체 단어 가져오기
	public ArrayList<WordVO> selectAllWord(String id){
		ArrayList<WordVO> words = dao.selectAllWord(id);
		return words;
		
	}
	
	//암기 단어로 체인지
	public int updateMemoWord(int word_num) {
		int cnt = 0;
		cnt = dao.updateMemoWord(word_num);
		
		return cnt;
	}
	
	//암기 단어로 체인지
	public int updateNotMemoWord(int word_num) {
		int cnt = 0;
		cnt = dao.updateNotMemoWord(word_num);
			
		return cnt;
	}
	
	//단어 삭제
	public int deleteWord(int word_num) {	
		int cnt = 0;
		cnt = dao.deleteWord(word_num);
			
		return cnt;
	}
	
	//전체 단어 갯수
	public int countWord(String id) {
		int cnt = 0;
		cnt = dao.countWord(id);
			
		return cnt;
		
	}
	
	//암기 단어 갯수
	public int countMemoWord(String id) {
		int cnt = 0;
		cnt = dao.countMemoWord(id);
				
		return cnt;
			
	}	
	
	//미암기 단어 갯수
	public int countNotMemoWord(String id) {
		int cnt = 0;
		cnt = dao.countNotMemoWord(id);
				
		return cnt;
			
	}	
}
