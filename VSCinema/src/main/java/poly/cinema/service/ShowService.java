package poly.cinema.service;

import java.util.List;

import poly.cinema.entity.Movie;
import poly.cinema.entity.Show;

public interface ShowService {
	List<Show> getAll();
	Show create(Show show);
	void deleteById(Integer id);
	Show getOne(Integer id);
	List<Show> fillByMovie(Integer movieid);
	List<Show> fillByMovieAndRoom(Integer movieid, String roomname);
	List<Show> fillByRoom(String roomname);
	List<String> listShowDate();
}
