package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Appointment;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AppointmentDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addAppointment(Appointment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Appointment saved successfully, Appointment Details="+p);
	}

	@Override
	public void updateAppointment(Appointment p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Appointment updated successfully, Appointment Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Appointment> listAppointments() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Appointment> appointmentsList = session.createQuery("from Appointment").list();
		for(Appointment p : appointmentsList){
			logger.info("Appointment List::"+p);
		}
		return appointmentsList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Appointment> listAppointmentsForUser(int userId, boolean history) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Appointment> appointmentsList;
		if (history) {
			appointmentsList = session.createQuery("from Appointment where User_id = " + userId + " and date < now()").list();
		} else {
			appointmentsList = session.createQuery("from Appointment where User_id = " + userId + " and date >= now()").list();
		}
		
		for(Appointment p : appointmentsList){
			logger.info("Appointment List::"+p);
		}
		return appointmentsList;
	}

	@Override
	public Appointment getAppointmentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Appointment p = (Appointment) session.load(Appointment.class, new Integer(id));
		logger.info("Appointment loaded successfully, Appointment details="+p);
		return p;
	}

	@Override
	public void removeAppointment(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Appointment p = (Appointment) session.load(Appointment.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Appointment deleted successfully, appointment details="+p);
	}

}
