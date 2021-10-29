package poly.cinema.service;

import java.util.List;

import poly.cinema.entity.Seat;

public interface SeatService {
	
	List<Seat> findByRoomIds(Integer roomid);
}
