package poly.cinema.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.OrderDAO;
import poly.cinema.dao.OrderFoodDAO;
import poly.cinema.entity.Order;
import poly.cinema.entity.OrderFood;
@Service
public class OrderService implements poly.cinema.service.OrderService {
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderFoodDAO ordfdao;
	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<OrderFood> findByOrderId(String orderid) {
		// TODO Auto-generated method stub
		return ordfdao.findByOrderId(orderid);
	}
	@Override
	public Order updateActive(String id,Order order) {
		order=dao.findById(id).get();
		order.setActive(true);
		return dao.save(order);
	}
	@Override
	public List<Order> findByDate(Date createdate) {
		return dao.findByDate(createdate);
	}

	@Override
	public List<Object[]> listSumRevenues() {
		// TODO Auto-generated method stub
		return dao.getListSumRevebues();
	}
	@Override
	public Long getSumRevenuesOfDay() {
		// TODO Auto-generated method stub
		return dao.revenueOfDay(new Date());
	}
	@Override
	public Long getSumRevenuesOfMonth() {
		// TODO Auto-generated method stub
		return dao.revenueOfMonth(new Date());
	}
	@Override
	public Long getSumRevenuesOfYear() {
		// TODO Auto-generated method stub
		return dao.revenueOfYears(new Date());
	}
}
