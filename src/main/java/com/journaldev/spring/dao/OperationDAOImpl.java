package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Operation;

@Repository
public class OperationDAOImpl implements OperationDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OperationDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addOperation(Operation p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Operation saved successfully, Operation Details="+p);
	}

	@Override
	public void updateOperation(Operation p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Operation updated successfully, Operation Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Operation> listOperations() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Operation> operationsList = session.createQuery("from Operation").list();
		for(Operation p : operationsList){
			logger.info("Operation List::"+p);
		}
		return operationsList;
	}

	@Override
	public Operation getOperationById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Operation p = (Operation) session.load(Operation.class, new Integer(id));
		logger.info("Operation loaded successfully, Operation details="+p);
		return p;
	}

	@Override
	public void removeOperation(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Operation p = (Operation) session.load(Operation.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Operation deleted successfully, operation details="+p);
	}

}
