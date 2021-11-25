package poly.cinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping({"/admin","/admin/home/index"})
	public String admin () {
		return "redirect:/assets/admin/index3.html";
	}
	
	@RequestMapping("/security/login/form")
	public String login () {
		return "account/login";
	}
	
	@RequestMapping("/security/signup/form")
	public String signup () {
		return "account/signup";
	}
	
	@RequestMapping("/security/update/form")
	public String update () {
		return "account/update_account";
	}
	
	@RequestMapping("/security/change/form")
	public String changePassword () {
		return "account/change_password";
	}
	
	@RequestMapping("/security/token/change")
	public String tokenChangPassword () {
		return "account/change_token";
	}
	
	@RequestMapping("/security/forgot/form")
	public String forgotPassword () {
		return "account/forgot_password";
	}
	
	@RequestMapping("/security/token/forgot")
	public String tokenForgotPassword () {
		return "account/forgot_token";
	}
	
	@RequestMapping("/security/login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Đăng nhập thành công!");
		return "redirect:/admin/home/index";
	}
	
	@RequestMapping("/security/login/error")
	public String loginError(Model model) {
		Object message = session.getAttribute("error");
		if(message != null) {
			model.addAttribute("message", message);
		} else {
			model.addAttribute("message", "Sai thông tin đăng nhập!");
		}
		return "account/login";
	}
}
