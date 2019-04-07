package free.resist.dao;

import java.util.HashMap;
import java.util.List;

import free.admin.vo.ChargeListVo;
import free.applygetlist.vo.ApplyGetListVo;

public interface ResistDao {

	void NewFreeLnRegist(HashMap<String, Object> map);

	int idcheck(String userid);

	List<ApplyGetListVo> ProjApply(HashMap<String, Object> map);

	void ProjApplyUpdate(HashMap<String, Object> map);

}
