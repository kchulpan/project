package free.session.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import free.admin.service.FreelancerListService;
import free.admin.vo.ChargeListVo;
import free.admin.vo.FreelancerCareerVo;
import free.admin.vo.FreelancerListVo;
import free.applygetlist.vo.ApplyGetListVo;
import free.main.service.MainFreelnService;
import free.main.vo.ProjectListVo;
import free.resist.service.ResistService;
import free.session.service.SessionService;
import free.session.vo.SessionVo;


@Controller
public class SessionController 
{
	//로그인 정보를 보관할 session 설정
	private HttpSession session;
	
	@Autowired
	private SessionService sessionService;
	@Autowired
	MainFreelnService mainFreelnService;
	@Autowired
	FreelancerListService freelancerListService;
	@Autowired
	ResistService resistservice;
	
	@RequestMapping("/LoginProcess")
	public ModelAndView loginProcess(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request)
	{
		//map{userid, userpass}
		ModelAndView mav = new ModelAndView();
		
		//project list
		List<ProjectListVo> projectList = mainFreelnService.projectList(map);	
		mav.addObject("projectList", projectList);
		
		
		
		
		
		// login session 프리랜서 - 관리자 분류
		SessionVo vo = sessionService.login(map);
		if(vo == null) {
			//로그인 실패		
			System.out.println("로그인 실패");
			mav.setViewName("LOGIN/login");
		}
		else 
		{
			String checkId = vo.getUserid();
			System.out.println("로그인id비교:"+checkId);
			if(checkId.startsWith("0"))//로그인 성공
			{
				System.out.println("프리랜서 로그인 성공");
				String userid = vo.getUserid();
				
				session = request.getSession();
				session.setAttribute("userid", userid);
				
				//career list
				List<FreelancerCareerVo> freelancerCareer = mainFreelnService.freelancerCareerList(map);
				mav.addObject("freelancerCareer", freelancerCareer);
				//freeln_id
				String freeln_id = freelancerCareer.get(0).getFreeln_id();
				mav.addObject("freeln_id",freeln_id);
				//프리랜서 메인 페이지로 가야함
				mav.setViewName("FREELNMAIN/freelnMain");
				mav.addObject("vo",vo);
			}
			else if(checkId.startsWith("A"))//로그인 성공
			{
				System.out.println("관리자 로그인 성공");
				String userid = vo.getUserid();
				
				session = request.getSession();
				session.setAttribute("userid", userid);
				
				/*List<FreelancerListVo> freelancerList = freelancerListService.freelancerList();	

				//경력 n개월 -> n년 n개월
				for (int i = 0; i < freelancerList.size(); i++) {
					int career_year = Integer.parseInt(freelancerList.get(i).getCareer_year());
					int year = career_year / 12;
					int month = career_year % 12;
					String fmt = "%d년 %d개월";
					String fmt_0 = "%d개월";
					String r_career_year = "";
					if(year == 0 ) {
						r_career_year = String.format(fmt_0, month);
					} else {
						r_career_year = String.format(fmt, year, month);
					}
					freelancerList.get(i).setCareer_year(r_career_year);
				}
				
				mav.addObject("freelancerList", freelancerList);
				mav.setViewName("ADMIN/01_FLEENL/freeln");*/
				List<ApplyGetListVo> ApplyList = resistservice.ProjApply(map);
				System.out.println(ApplyList);
				mav.addObject("ApplyList", ApplyList);
				mav.setViewName("ADMIN/00_COMMON/commoncode");
				/*mav.addObject("vo",vo);*/
			}
		}
		
		
		return mav;
	}
	
	@RequestMapping("/Logout")
	public ModelAndView logout(HttpSession session)
	{
		session.invalidate(); // 세션 전체 초기화
		//session.removeAttribute("userid"); 세션해당키만 지움
		
		ModelAndView mav = new ModelAndView("LOGIN/login");
		
		return mav;
	}
	
/*	@RequestMapping
	public ModelAndView openLogin(HttpServletRequest request, HttpServletResponse response, CommandMap commanMap)
	throws Exception
	{
		ModelAndView mav = new ModelAndView();
		// 세션정보가 null 이 아닐때
		if(request.getSession().getAttribute("loginInfo")!=null)
		{
			String msg = "이미 로그인 되었습니다.";
			mav.addObject("msg", msg);
			mav.setViewName("프리랜서or관리자 페이지");
		}
		else
		{
			mav.setViewName("LOGIN/login");
		}
		return mav;
		
	}
	
	@RequestMapping("/LoginCheck")
	public ModelAndView login(HttpServletRequest request, Map<String,Object> commandMap)
	throws Exception
	{
		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap);
		Map<String, Object> map = SessionService.selectUserInfo(commandMap);
		
		//로그인 정보가 있다면 로그인
		if(map == null)
		{
			mav.addObject("msg", "로그인에 실패하였습니다");
		}
		else
		{
			request.getSession().setAttribute("loginInfo", map);
			request.getSession().setMaxInactiveInterval(60*30);
			
			mav.addObject("msg", "로그인에 성공하였습니다");
		}
		return mav;
		
		
	}*/
}
