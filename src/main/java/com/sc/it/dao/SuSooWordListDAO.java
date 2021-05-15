package com.sc.it.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sc.it.vo.WordListVO;

@Repository
public class SuSooWordListDAO {

	@Autowired
	private SqlSession session;
	
	// 게시판 목록 생성
	public int wordList(WordListVO list) {
		int cnt = 0;
		
		try {
			SuSooWordListMapper mapper = session.getMapper(SuSooWordListMapper.class);
			cnt = mapper.wordList(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 게시판 목록 조회
	public ArrayList<HashMap<String, Object>> selectList(String s_id) {
		ArrayList<HashMap<String, Object>> vo = null;
		
		try {
			SuSooWordListMapper mapper = session.getMapper(SuSooWordListMapper.class);
			vo = mapper.selectList(s_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	// 게시판 삭제
	public void deleteWordList(int wordlist_num) {
		try {
			SuSooWordListMapper mapper = session.getMapper(SuSooWordListMapper.class);
			mapper.deleteWordList(wordlist_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
