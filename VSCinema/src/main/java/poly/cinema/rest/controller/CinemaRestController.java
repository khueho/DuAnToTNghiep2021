package poly.cinema.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import poly.cinema.entity.Cinema;
import poly.cinema.service.CinemaService;

@RestController
@RequestMapping("rest/cinemas")
public class CinemaRestController {
	@Autowired
	CinemaService cinemaService;
	@GetMapping
	public List<Cinema> getAll(){
		return cinemaService.findAll();
	}
}
