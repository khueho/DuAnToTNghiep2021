package poly.cinema.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.cinema.entity.User;

public interface UserDAO extends JpaRepository<User, String>{

}
