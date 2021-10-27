package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.cinema.entity.Room;

public interface RoomDAO extends JpaRepository<Room, Integer> {
	@Query("SELECT r FROM Room r where cinema.id=?1")
	public List<Room> getBycinemaId(Integer cinemaid);
	@Query("SELECT r FROM Room r where r.name like ?1")
	public List<Room> findByName(String name);
}
