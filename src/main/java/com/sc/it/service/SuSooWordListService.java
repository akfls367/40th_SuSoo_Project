package com.sc.it.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.it.dao.SuSooWordListDAO;
import com.sc.it.vo.WordListVO;

@Service
public class SuSooWordListService {

	@Autowired
	private SuSooWordListDAO dao;
	
	@Autowired
	private HttpSession session;
	
	// 게시판 리스트 생성
	public String insertList(WordListVO list) {
		int cnt = dao.wordList(list);
		
		String path = cnt > 0 ? "redirect:/word/wordListForm" : "redirect:/word/wordListForm";
		return path;
	}
	
	// 게시판 리스트 조회
	public ArrayList<HashMap<String, Object>> selectList(){
		String s_id = (String)session.getAttribute("s_id");
		return dao.selectList(s_id);
	}
	
	// 게시판 삭제
	public void deleteWordList(int wordlist_num) {
		dao.deleteWordList(wordlist_num);
	}
}
