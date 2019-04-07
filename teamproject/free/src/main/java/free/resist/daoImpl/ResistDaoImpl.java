package free.resist.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import free.admin.vo.ChargeListVo;
import free.applygetlist.vo.ApplyGetListVo;
import free.resist.dao.ResistDao;

@Repository("resistDao")
public class ResistDaoImpl implements ResistDao {

	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void NewFreeLnRegist(HashMap<String, Object> map) 
	{
		System.out.println("던지는 값:" + map);
		sqlSession.insert("Client_Reg.ClientReginsert", map);
		
	}

	@Override
	public int idcheck(String userid) 
	{
		int count = sqlSession.selectOne("Client_Reg.idDoubleCheck",userid);
		return count;
	}

	@Override
	public List<ApplyGetListVo> ProjApply(HashMap<String, Object> map) {
		
		sqlSession.selectList("apply.getList", map);
		List<ApplyGetListVo> ApplyList = (List<ApplyGetListVo>) map.get("result");
		System.out.println("daw"+ApplyList);
		return ApplyList;
	}

	@Override
	public void ProjApplyUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("apply.getUpdate",map);
	}





}
