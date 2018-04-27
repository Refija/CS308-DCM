package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Staff;

@Repository
public class StaffDAOImpl implements StaffDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addStaff(Staff u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("Staff saved successfully, Staff Details="+u);
	}

	@Override
	public void updateStaff(Staff u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("Staff updated successfully, Staff Details="+u);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Staff> listStaff() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Staff> StaffList = session.createQuery("from Staff").list();
		for(Staff u : StaffList){
			logger.info("Staff List::"+u);
		}
		return StaffList;
	}

	@Override
	public Staff getStaffById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Staff u = (Staff) session.load(Staff.class, new Integer(id));
		logger.info("Staff loaded successfully, Staff details="+u);
		return u;
	}

	@Override
	public void removeStaff(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Staff u = (Staff) session.load(Staff.class, new Integer(id));
		if(null != u){
			session.delete(u);
		}
		logger.info("Staff deleted successfully, Staff details="+u);
	}

}
