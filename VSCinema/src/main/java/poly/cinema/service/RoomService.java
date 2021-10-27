package poly.cinema.service;

import java.util.List;

import poly.cinema.entity.Room;

public interface RoomService {
	List<Room> getAll();

	Room save(Room room);

	void delete(Integer id);

	Room update(Room room);

	List<Room> findByCinemaId(Integer cinemaid);
	
	List<Room> findByName(String name);
}
