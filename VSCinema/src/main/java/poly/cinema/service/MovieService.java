package poly.cinema.service;

import java.util.List;

import poly.cinema.entity.Movie;

public interface MovieService {
	List<Movie> getAll();

	List<Movie> fillByName(String name);
}
