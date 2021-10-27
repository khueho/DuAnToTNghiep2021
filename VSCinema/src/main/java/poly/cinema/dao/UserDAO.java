package poly.cinema.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.Account;

public interface UserDAO extends JpaRepository<Account, String>{

}
