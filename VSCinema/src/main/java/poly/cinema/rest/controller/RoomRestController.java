package poly.cinema.rest.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import poly.cinema.entity.Room;
import poly.cinema.service.RoomService;

@RestController
@RequestMapping("rest/rooms")
public class RoomRestController {

	@Autowired
	RoomService roomService;

	@GetMapping
	public List<Room> getAll() {
		return roomService.getAll();
	}

	@PostMapping
	public Room save(@RequestBody @Valid Room room) {
		return roomService.save(room);
	}
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Integer id) {
		roomService.delete(id);
	}
	@PutMapping("{id}")
	public Room update(@PathVariable("id") Integer id,@RequestBody @Valid Room room) {
		return roomService.update(room);
	}
	@GetMapping("{id}")
	public List<Room> getByCinemaId(@PathVariable("id")Integer cinemaid){
		return roomService.findByCinemaId(cinemaid);
	}
	@GetMapping("/name")
	public List<Room> getByName(@RequestParam("name")String name){
		return roomService.findByName(name);
	}
}
