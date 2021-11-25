package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.cinema.entity.Movie;
import poly.cinema.entity.Show;

public interface ShowDAO extends JpaRepository<Show, Integer>{
	@Query("Select s from Show s where s.Activity = true")
	List<Show> getAll();
	@Query("Select s from Show s where s.Activity = true and s.movie.id = :movieid")
	List<Show> findByMovie(Integer movieid);
	@Query("Select s from Show s where s.Activity = true and s.room.name = :roomname")
	List<Show> findByRoom(String roomname);
	@Query("Select s from Show s where s.Activity = true and s.movie.id = :movieid and s.room.name = :roomname")
	List<Show> findByMovieAndRoom(Integer movieid, String roomname);
	@Query("Select s.showDate from Show s where s.Activity = true group by s.showDate")
	List<String> listShowDate();
}