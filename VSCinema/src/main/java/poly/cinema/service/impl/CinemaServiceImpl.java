package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.CinemaDAO;
import poly.cinema.entity.Cinema;
import poly.cinema.service.CinemaService;

@Service
public class CinemaServiceImpl implements CinemaService {

	@Autowired
	CinemaDAO dao;

	@Override
	public List<Cinema> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
