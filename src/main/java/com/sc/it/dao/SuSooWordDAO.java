package com.sc.it.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sc.it.vo.WordVO;

@Repository
public class SuSooWordDAO {

	@Autowired
	private SqlSession session;
	
	//리스트 단어 가져오기
	public ArrayList<WordVO> selectListWord(WordVO vo){
		ArrayList<WordVO> list = null;
		
		try {
	         SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
	         list = mapper.selectListWord(vo);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	}
	
	
	 // 단어 생성
	   public int insertWord(WordVO word) {
	      int vo = 0;
	      
	      try {
	         SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
	         vo = mapper.insertWord(word);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return vo;
	   }
	//전체 단어 가져오기
	public ArrayList<WordVO> selectAllWord(String id){
		ArrayList<WordVO> words = null;
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			words = mapper.selectAllWord(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return words;
	}
	
	//암기 단어로 체인지
	public int updateMemoWord(int word_num) {
		int cnt = 0;
		
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.updateMemoWord(word_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//미암기 단어로 체인지
	public int updateNotMemoWord(int word_num) {
		int cnt = 0;
			
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.updateNotMemoWord(word_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//단어 삭제
	public int deleteWord(int word_num) {
		int cnt = 0;
		
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.deleteWord(word_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//전체 단어 갯수
	public int countWord(String id) {
		int cnt = 0;
		
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.countWord(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	//암기 단어 갯수
	public int countMemoWord(String id) {
		int cnt = 0;
			
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.countMemoWord(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
			
	}
	
	//미암기 단어 갯수
	public int countNotMemoWord(String id) {
		int cnt = 0;
			
		try {
			SuSooWordMapper mapper = session.getMapper(SuSooWordMapper.class);
			cnt = mapper.countNotMemoWord(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
			
	}
}
