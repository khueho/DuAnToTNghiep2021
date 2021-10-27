package poly.cinema.service;

import java.util.List;

import poly.cinema.entity.Order;
import poly.cinema.entity.OrderFood;

public interface OrderService  {
	List<Order> findAll();
	
	List<OrderFood> findByOrderId(String orderid);
	
	Order updateActive(String id,Order order);
}
