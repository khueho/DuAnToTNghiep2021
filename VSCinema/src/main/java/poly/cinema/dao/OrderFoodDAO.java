package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.cinema.entity.OrderFood;

public interface OrderFoodDAO extends JpaRepository<OrderFood, Integer> {
	@Query("SELECT orf FROM OrderFood orf where orf.order.id=?1")
	public List<OrderFood> findByOrderId(String orderid);

}
