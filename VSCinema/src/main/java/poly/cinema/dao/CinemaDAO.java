package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.cinema.entity.Cinema;

public interface CinemaDAO extends JpaRepository<Cinema, Integer> {
	@Query("Select c from Cinema c where c.city.id = :cityid")
	List<Cinema> findByCity(String cityid);
}
