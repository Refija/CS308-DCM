package com.journaldev.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="Appointment")
public class Appointment {

	private int id;
	private Date date;
	private String time;
	
	private User User_id;
	
	private Staff Staff_id;
	
	private Operation Operation_id;
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@OneToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return User_id;
	}
	public void setUser(User User_id) {
		this.User_id = User_id;
	}
	
	@ManyToOne
	@JoinColumn(name = "staff_id")
	public Staff getStaff() {
		return Staff_id;
	}
	public void setStaff(Staff Staff_id) {
		this.Staff_id = Staff_id;
	}
	
	@ManyToOne
	@JoinColumn(name = "operation_id")
	public Operation getOperation() {
		return Operation_id;
	}
	public void setOperation(Operation Operation_id) {
		this.Operation_id = Operation_id;
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", date=" + date + ", time=" + time + ", User_id=" + User_id + ", Staff_id="
				+ Staff_id + ", Operation_id=" + Operation_id + "]";
	}
	
	
}
