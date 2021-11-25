package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import poly.cinema.entity.Ticket;

public interface TicketDAO extends JpaRepository<Ticket, String>{
	
}