package poly.cinema.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.cinema.entity.Order;

public interface OrderDAO extends JpaRepository<Order, String> {

	@Query("Select o from Order o where o.createdate=?1")
	List<Order> findByDate(Date createdate);
}