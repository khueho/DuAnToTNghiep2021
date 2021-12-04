package poly.cinema.service;

import java.util.Date;
import java.util.List;

import poly.cinema.entity.Order;
import poly.cinema.entity.OrderFood;

public interface OrderService  {
	List<Order> findAll();
	
	List<OrderFood> findByOrderId(String orderid);
	
	Order updateActive(String id,Order order);
	List<Order> findByDate(Date createdate);
	
	List<Object[]> listSumRevenues();
	Long getSumRevenuesOfDay();
	Long getSumRevenuesOfMonth();
	Long getSumRevenuesOfYear();
}
