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
		
		// ��й�ȣ ��ȣȭ ��ü ����
		AES256Util aES256Util = new AES256Util("newMemberInsertKey");
		
		// �ű԰����ڰ� �Է��� ��й�ȣ �������� 
		String userPwd = (String) hashmap.get("userPwd");
		
		// AES256Util ��ü�� ��ȣȭ �޼ҵ� ȣ��
		String aesPwd = aES256Util.aesEncode(userPwd);
		
		// ��ȣȭ�� return ���� hashmap�� ����
		hashmap.put("userPwd", aesPwd);
		
		// DAO�� ����
		memberDao.insertMember(hashmap);
	}

}
