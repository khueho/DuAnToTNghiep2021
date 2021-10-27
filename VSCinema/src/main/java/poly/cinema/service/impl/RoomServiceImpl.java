package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.RoomDAO;
import poly.cinema.entity.Room;
import poly.cinema.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	RoomDAO dao;

	@Override
	public List<Room> getAll() {
		return dao.findAll();
	}

	@Override
	public Room save(Room room) {
		// TODO Auto-generated method stub
		return dao.save(room);
	}

	@Override
	public void delete(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public Room update(Room room) {
		// TODO Auto-generated method stub
		return dao.save(room);
	}

	@Override
	public List<Room> findByCinemaId(Integer cinemaid) {
		// TODO Auto-generated method stub
		return dao.getBycinemaId(cinemaid);
	}

	@Override
	public List<Room> findByName(String name) {
		return dao.findByName('%'+name+"%");
	}
}
