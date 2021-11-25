package poly.cinema.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.AccountDAO;
import poly.cinema.dao.FoodDao;
import poly.cinema.dao.PriceHistoryDAO;
import poly.cinema.entity.Account;
import poly.cinema.entity.Food;
import poly.cinema.entity.PriceHistory;
import poly.cinema.service.FoodService;
import poly.cinema.service.PriceHistoryService;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao foodDao;
	@Autowired
	HttpServletRequest request;

	@Autowired
	AccountDAO accountDao;
	
	@Autowired
	PriceHistoryDAO historyDAO;
	
	@Autowired
	PriceHistoryService priceHistoryService;

	@Override
	public List<Food> findAll() {
		// TODO Auto-generated method stub
		String user = request.getRemoteUser();
		System.out.println("Usser: " + user);

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
		String user = request.getRemoteUser(); // Lấy user đang login 
		Account account = accountDao.findById(user).get(); // Tìm user trong csdl
		
		foodDao.save(food);
	
		return food;
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