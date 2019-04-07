package free.resist.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.admin.vo.ChargeListVo;
import free.applygetlist.vo.ApplyGetListVo;
import free.resist.dao.ResistDao;
import free.resist.service.ResistService;
@Service("resistService")
public class ResistServiceImpl implements ResistService {

	@Autowired
	ResistDao resistDao;
	
	@Override
	public void NewFreeLnRegist(HashMap<String, Object> map) 
	{
		resistDao.NewFreeLnRegist(map);
		
	}


	@Override
	public int idcheck(String userid) 
	{
		int count = resistDao.idcheck(userid);
		return count;
	}


	@Override
	public List<ApplyGetListVo> ProjApply(HashMap<String, Object> map) {
		
		List<ApplyGetListVo> ApplyList = resistDao.ProjApply(map);
		System.out.println("ser"+ApplyList);
		return ApplyList;
	}


	@Override
	public void ProjApplyUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		resistDao.ProjApplyUpdate(map);
	}

}
