package poly.cinema.entity;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "tickets")
public class Ticket  implements Serializable{
	@Id
	String id;
	Integer ticketPrice;
	Integer totalMoney ;
	Double discount ;
	Boolean activity;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date creatDate = new Date();
	
	@ManyToOne
	@JoinColumn(name = "Seatid")
	Seat seat;
	
	@ManyToOne
	@JoinColumn(name = "Showsid")
	Show show;
	
	
	@ManyToOne
	@JoinColumn(name = "Username")
	User user;
	
	@JsonIgnore
	@OneToMany(mappedBy = "ticket")
	List<TicketCoupon> ticketCoupons;
	

	
	
}
