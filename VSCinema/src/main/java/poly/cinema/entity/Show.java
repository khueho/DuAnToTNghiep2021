package poly.cinema.entity;

import java.io.Serializable;
import java.sql.Time;
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
@Table(name = "shows")
public class Show  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Showdate")
	Date showDate = new Date();
	
	@Temporal(TemporalType.TIME)
	@Column(name = "Starttime")
	Date startTime = new Date();
	
	@Temporal(TemporalType.TIME)
	@Column(name = "Endtime")
	Date endTime = new Date();

	
	
	@ManyToOne
	@JoinColumn(name = "Moviesid")
	Movie movie;
	
	@ManyToOne
	@JoinColumn(name = "Roomsid")
	Room room;
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "show")
	List<Ticket> tickets;

	
	

	
}