package com.sc.it.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sc.it.vo.UserVO;

@Repository
public class SuSooUserDAO {

	@Autowired
	private SqlSession session;
	
	// ID중복체크
	   public UserVO checkID(String s_id) {
	      UserVO vo = null;
	      
	      try {
	         SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
	         vo = mapper.checkID(s_id);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return vo;
	   }
	
	// 회원가입
	public int insertUser(UserVO user) {
		int cnt = 0;
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			cnt = mapper.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 로그인
	public UserVO selectUser(UserVO user) {
		UserVO vo = null;
		
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			vo = mapper.selectUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	// ID 찾기
	public String findId(UserVO user) {
		String list = null;
		
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			list = mapper.findId(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// PW 찾기
	public String findPw(UserVO user) {
		String list = null;
		
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			list = mapper.findPw(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 회원정보 변경
	public int changeUser(UserVO user) {
		int cnt = 0;
		
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			cnt = mapper.changeUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//PW변경
	public int changePw(UserVO user) {
		int cnt = 0;
		
		try {
			SuSooUserMapper mapper = session.getMapper(SuSooUserMapper.class);
			cnt = mapper.changePw(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
}
