package poly.cinema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.Order;

public interface OrderDAO extends JpaRepository<Order, String> {


}
