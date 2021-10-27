package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.SeatDAO;
import poly.cinema.entity.Seat;
import poly.cinema.service.SeatService;

@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	SeatDAO dao;

	@Override
	public List<Seat> findByRoomIds(Integer roomid) {
		// TODO Auto-generated method stub
		return dao.findByRoomId(roomid);
	}

}
