package poly.cinema.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.CinemaDAO;
import poly.cinema.dao.RoomDAO;
import poly.cinema.dao.ShowDAO;
import poly.cinema.entity.Movie;
import poly.cinema.entity.Room;
import poly.cinema.entity.Show;
import poly.cinema.service.ShowService;

@Service
public class ShowServicempl implements ShowService{
@Autowired ShowDAO showdao;
@Autowired CinemaDAO cinemadao;
@Autowired RoomDAO roomdao;
	@Override
	public List<Show> getAll() {
		return showdao.getAll();
	}


	@Override
	public Show create(Show show) {	
		return showdao.save(show);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		Show show = showdao.findById(id).get();
		show.setActivity(2);
		showdao.save(show);
	}

	@Override
	public Show getOne(Integer id) {
		// TODO Auto-generated method stub
		return showdao.findById(1).get();
	}


	@Override
	public List<Show> fillByMovie(Integer movieid) {
		// TODO Auto-generated method stub
		return showdao.findByMovie(movieid);
	}
	@Override
	public List<Show> fillByRoom(String roomname) {
		// TODO Auto-generated method stub
		return showdao.findByRoom(roomname);
	}
	@Override
	public List<Show> fillByMovieAndRoom(Integer movieid, String roomname) {
		// TODO Auto-generated method stub
		return showdao.findByMovieAndRoom(movieid, roomname);
	}
	
	@Override
	public List<String> listShowDate(){
		return showdao.listShowDate();
	}


	@Override
	public Show update(Show show) {
		return showdao.save(show);
	}


	@Override
	public List<Show> getShowCensor() {
		List<Show> list = new ArrayList<Show>();
		List<Show> findAll = showdao.findAll();
		Date date = new Date();
		findAll.forEach(s ->{
			if(s.getShowDate().getTime() >= date.getTime()) {
				list.add(s);
			}
		});
		return list;
	}
	
	@Override
	public List<Show> findMovieByShowdate() {
		// TODO Auto-generated method stub
		return showdao.findMovieByShowdate();
	}
	
}
