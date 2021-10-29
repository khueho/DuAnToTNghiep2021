package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.FoodDao;
import poly.cinema.entity.Food;
import poly.cinema.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao foodDao;

	@Override
	public List<Food> findAll() {
		// TODO Auto-generated method stub
		return foodDao.findAll();
	}

	@Override
	public Food findById(Integer id) {
		// TODO Auto-generated method stub
		return foodDao.findById(id).get();
	}

	@Override
	public Food create(Food food) {
		// TODO Auto-generated method stub
		return foodDao.save(food);
	}

	@Override
	public Food update(Food food) {
		// TODO Auto-generated method stub
		return foodDao.save(food);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		foodDao.deleteById(id);
	}

}
