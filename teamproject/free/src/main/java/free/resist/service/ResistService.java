package free.resist.service;

import java.util.HashMap;
import java.util.List;

import free.admin.vo.ChargeListVo;
import free.applygetlist.vo.ApplyGetListVo;

public interface ResistService {

	void NewFreeLnRegist(HashMap<String, Object> map);

	// 아이디 중복체크
	int idcheck(String userid);

	List<ApplyGetListVo> ProjApply(HashMap<String, Object> map);

	void ProjApplyUpdate(HashMap<String, Object> map);

}
