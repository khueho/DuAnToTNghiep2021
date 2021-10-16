package poly.cinema.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

import poly.cinema.entity.Authority;


@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "users")
public class User  implements Serializable{
	@Id
	String username;
	String password;
	String fullname;
	String email;
	String phone ;
	Boolean gender ;
	String cmnd ;
	String address ;
	String image;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Order> orders;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	List<Authority> authorities;
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Token> tokens;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<PriceHistory> priceHistories ;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Censor> censors;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Show> shows ;
	
	
	
}