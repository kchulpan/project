package free.login.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginController {
	
	@RequestMapping("/")
	public String logIn()
	{
		return "AJAX/AJAX";
	}
	@RequestMapping(value="/cFunction")
	public String cFunction() {
		return "AJAX/callbackFunction";
	}
	@RequestMapping("/responseXML")
	public String responseXML() {
		return "AJAX/responseXML";
	}

}