package poly.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	@RequestMapping("/food/booking-food")
	public String doan (Model model) {
		
		model.addAttribute("title", "Đồ ăn");
		return "/food/booking-food";
	}
	
	@RequestMapping("/food/checkout")
	public String checkout (Model model) {
		model.addAttribute("title", "Đồ ăn");
		return "/food/checkout";
	}
}
