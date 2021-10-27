package poly.cinema.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import poly.cinema.entity.Account;
import poly.cinema.service.UserService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/users")
public class UserRestController {

	@Autowired
	UserService userService;
	
	@GetMapping()
	public List<Account> getUsers() {
		return userService.finAll();
	}
	
}
