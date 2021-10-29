package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.Movie;

public interface MovieDAO extends JpaRepository<Movie, Integer>{
	List<Movie> findByName(String name);

}
