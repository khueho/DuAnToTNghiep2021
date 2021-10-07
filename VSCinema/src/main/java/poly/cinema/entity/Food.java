package poly.cinema.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;


@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "foods")
public class Food  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	String image;
	Integer price;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createdate = new Date();
	
	String description ;
	Boolean active ;
	
	@ManyToOne
	@JoinColumn(name = "Cinemasid")
	Cinema cinema;
	
	@JsonIgnore
	@OneToMany(mappedBy = "food")
	List<Sale> sales;
	
	@JsonIgnore
	@OneToMany(mappedBy = "food")
	List<PriceHistory> priceHistories ;
	
	@JsonIgnore
	@OneToMany(mappedBy = "food")
	List<OrderDetail> orderDetails ;
	
	
	
}