package com.journaldev.spring.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="Report")
public class Report {

	
	private int id;
	private String description;
	private Appointment Appointment_id;
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@OneToOne
	@JoinColumn(name = "appointment_id")
	public Appointment getAppointment() {
		return Appointment_id;
	}

	public void setAppointment(Appointment Appointment_id) {
		this.Appointment_id = Appointment_id;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", description=" + description + ", Appointment_id=" + Appointment_id + "]";
	}
	
}
