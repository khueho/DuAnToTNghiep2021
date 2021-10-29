package poly.cinema.rest.controller;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import poly.cinema.entity.Show;
import poly.cinema.service.CinemaService;
import poly.cinema.service.RoomService;
import poly.cinema.service.ShowService;

@RestController
@RequestMapping("/rest/show")
@CrossOrigin("*")
public class ShowRestController {
@Autowired ShowService showservice;
@Autowired RoomService roomservice;
@Autowired CinemaService cinemaservice;
	@GetMapping()
	public List<Show> getAll(){
		return showservice.getAll();
	}

	@PostMapping("")
	public Show create(@Valid @RequestBody Show show){
	Show create = showservice.create(show);
	return create;
	}
	
	
	
	@DeleteMapping("/{id}")
	public void deleteById(@PathVariable("id") Integer id) {
		showservice.deleteById(id);
	}
	
	
	@PostMapping("/fillmovie/{movieid}")
	public List<Show> fillByMovie(@PathVariable("movieid") Integer movieid){
		return showservice.fillByMovie(movieid);
	}

	@PostMapping("/fillroom/{roomid}")
	public List<Show> fillByRoom(@PathVariable("roomid") Integer roomid){
		String roomname = roomservice.getNameByID(roomid);
		//System.out.println(roomname);
		return showservice.fillByRoom(roomname);
	}
	@PostMapping("/fillmovieandroom/{movieid}/{roomid}")
	public List<Show> fillByMovieAndRoom(@PathVariable("movieid") Integer movieid, @PathVariable("roomid") String roomname){
		return showservice.fillByMovieAndRoom(movieid, roomname);
	}}
