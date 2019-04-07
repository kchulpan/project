package com.spring.user.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.user.AES256Util.AES256Util;
import com.spring.user.dao.MemberDao;
import com.spring.user.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void insertMember(HashMap<String, Object> hashmap) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		
		// 비밀번호 암호화 객체 생성
		AES256Util aES256Util = new AES256Util("newMemberInsertKey");
		
		// 신규가입자가 입력한 비밀번호 가져오기 
		String userPwd = (String) hashmap.get("userPwd");
		
		// AES256Util 객체의 암호화 메소드 호출
		String aesPwd = aES256Util.aesEncode(userPwd);
		
		// 암호화된 return 값을 hashmap에 대입
		hashmap.put("userPwd", aesPwd);
		
		// DAO로 전달
		memberDao.insertMember(hashmap);
	}

}
