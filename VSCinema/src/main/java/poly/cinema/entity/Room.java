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
@Table(name = "rooms")
public class Room  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	Integer totalcolumn;
	Integer totalrow ;
	Boolean activity ;
	
	
	@ManyToOne
	@JoinColumn(name = "Cinemasid")
	Cinema cinema;
	
	
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "room")
	List<Show> show;	
	
	@JsonIgnore
	@OneToMany(mappedBy = "room")
	List<Seat> seats ;
	
	
	
	
}