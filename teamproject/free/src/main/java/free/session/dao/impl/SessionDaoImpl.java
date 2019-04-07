package free.session.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.session.dao.SessionDao;
import free.session.vo.SessionVo;

@Repository("sessionDao")
public class SessionDaoImpl implements SessionDao
{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SessionVo login(HashMap<String, Object> map) 
	{
		String userid =  String.valueOf(map.get("userid"));
		SessionVo vo = null;
		System.out.println("던지는맵:"+map);
		if(userid.startsWith("0"))
		{
			sqlSession.selectOne("Freeln.FreeLnSession", map);
			List<SessionVo> listvo = (List<SessionVo >) map.get("result");
			System.out.println("listvo::"+listvo);
			if(listvo.size() != 0)
			{
				vo = listvo.get(0);
			}
			else
			{
				vo = null;
			}
			
		}
		else if(userid.startsWith("A"))
		{
			sqlSession.selectOne("Admin.AdminSession", map);
			List<SessionVo> listvo = (List<SessionVo>) map.get("result");
			System.out.println("가져온값:" +listvo);
			if(listvo.size() != 0)
			{
				vo = listvo.get(0);
			}
			else
			{
				System.out.println("아이디는 맞는데 비밀번호 틀맀다");
				vo = null;
			}
		}
		else
		{
			System.out.println("아이디 잘못 기입");
		}
		return vo;
/*		System.out.println(vo.getUserid());*/
	}
}