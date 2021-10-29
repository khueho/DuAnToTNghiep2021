package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.MovieDAO;
import poly.cinema.entity.Movie;
import poly.cinema.service.MovieService;

@Service
public class MovieServiceimpl implements MovieService{
@Autowired MovieDAO moviedao;
	
	@Override
	public List<Movie> getAll() {
		// TODO Auto-generated method stub
		return moviedao.findAll();
	}

	@Override
	public List<Movie> fillByName(String name) {
		// TODO Auto-generated method stub
		return moviedao.findByName(name);
	}
	
}
