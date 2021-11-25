package poly.cinema.rest.controller;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import poly.cinema.entity.Order;
import poly.cinema.entity.OrderFood;
import poly.cinema.service.OrderService;

@RestController
@RequestMapping("rest/orders")
public class OrderRestController {
	@Autowired
	OrderService orderService;
	@GetMapping
	public List<Order> getAll() {
		return orderService.findAll();
	}
	@GetMapping("{orderid}")
	public List<OrderFood> findByOrderId(@PathVariable("orderid")String orderid) {
		return orderService.findByOrderId(orderid);
	}
	@PutMapping("{id}")
	public Order updateActive(@PathVariable("id") String id,@RequestBody Order order) {
		return orderService.updateActive(id,order);
	}
	
	@GetMapping("/findbydate/{createdate}")
	public List<Order> findByDate(@PathVariable("createdate")Date createdate) {
		return orderService.findByDate(createdate);
	}
}
