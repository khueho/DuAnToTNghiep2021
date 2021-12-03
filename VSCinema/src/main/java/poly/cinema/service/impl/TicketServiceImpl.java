
package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import poly.cinema.dao.TicketDAO;
import poly.cinema.entity.Ticket;
import poly.cinema.service.TicketService;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	TicketDAO dao;
	

	@Override
	public List<Ticket> findAll() {
		return dao.findAll();
	}
	
}