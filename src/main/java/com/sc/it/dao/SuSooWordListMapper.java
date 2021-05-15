package com.sc.it.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sc.it.vo.WordListVO;

public interface SuSooWordListMapper {

	// 게시판 리스트 생성
	public int wordList(WordListVO list);
	
	// 게시판 조회
	public ArrayList<HashMap<String, Object>> selectList(String s_id);
	
	// 게시판 삭제
	public void deleteWordList(int wordlist_num);
}
