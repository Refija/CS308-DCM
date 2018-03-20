package cs308dcm.models;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="Appointment")
public class Appointment {
	private int id;
	private Date dateOfBirth;
	@OneToOne
	@JoinColumn(name = "id", table = "User")
	private User user;
	@ManyToOne
	@JoinColumn(name = "id", table = "Staff")
	private Staff staff;
	@ManyToOne
	@JoinColumn(name = "id", table = "Procedure")
	private Procedure procedure;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public Procedure getProcedure() {
		return procedure;
	}
	public void setProcedure(Procedure procedure) {
		this.procedure = procedure;
	}
}
