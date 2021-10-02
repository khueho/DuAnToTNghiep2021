package poly.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TheaterController {
	@RequestMapping("theater/list")
	public String theaterList() {
		return "theater/list";
	}
}
