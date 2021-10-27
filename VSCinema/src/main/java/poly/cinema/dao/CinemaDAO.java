package poly.cinema.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.Cinema;

public interface CinemaDAO extends JpaRepository<Cinema, Integer> {

}
