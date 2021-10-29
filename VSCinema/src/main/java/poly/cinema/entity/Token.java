package poly.cinema.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor @AllArgsConstructor
@Entity 
@Table(name = "tokens")
public class Token  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String password;
	String code;
	@Temporal(TemporalType.DATE)
	@Column(name = "Expirydate")
	Date expirydate = new Date();
	
	@Temporal(TemporalType.TIME)
	@Column(name = "Expiry")
	Date expiry = new Date();
	
	Integer category;
	
	Boolean activity;
	
	@ManyToOne
	@JoinColumn(name = "Username")
	Account user;

	public Token(String password, String code, Date expirydate, Date expiry, Integer category, Boolean activity,
			Account user) {
		super();
		this.password = password;
		this.code = code;
		this.expirydate = expirydate;
		this.expiry = expiry;
		this.category = category;
		this.activity = activity;
		this.user = user;
	}
	
}

