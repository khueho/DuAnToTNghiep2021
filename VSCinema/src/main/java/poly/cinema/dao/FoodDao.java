package poly.cinema.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.Food;

public interface FoodDao extends JpaRepository<Food, Integer> {

}
