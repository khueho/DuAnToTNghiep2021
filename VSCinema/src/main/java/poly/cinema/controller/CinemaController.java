package poly.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CinemaController {
	@RequestMapping("cinema/cinema-list")
	public String theaterList() {
		return "cinema/cinema-list";
	}
}
