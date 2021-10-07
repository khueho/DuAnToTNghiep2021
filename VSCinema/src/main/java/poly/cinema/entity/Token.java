package poly.cinema.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "tokens")
public class Token  implements Serializable{
	@Id
	String id;
	
	
	@Temporal(TemporalType.TIME)
	@Column(name = "Expiry")
	Date expiry = new Date();
	
	@ManyToOne
	@JoinColumn(name = "Username")
	User user;
}

