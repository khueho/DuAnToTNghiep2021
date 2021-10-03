package poly.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoviesController {
	@RequestMapping("movies/list")
	public String list() {
		return "movies/list";
	}
	@RequestMapping("movie/detail")
	public String detail() {
		return "movie/detail";
	}
}
