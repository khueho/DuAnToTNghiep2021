package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.UserDAO;
import poly.cinema.entity.Account;
import poly.cinema.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public List<Account> finAll() {
		return userDAO.findAll();
	}
	
}
