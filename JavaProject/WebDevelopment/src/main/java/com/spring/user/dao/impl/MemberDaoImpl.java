package com.spring.user.dao.impl;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.user.dao.MemberDao;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMember(HashMap<String, Object> hashmap) {
		sqlSession.insert("UserReg.UserInsert", hashmap);
	}
	
}
