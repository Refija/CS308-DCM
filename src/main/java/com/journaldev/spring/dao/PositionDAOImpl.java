package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Position;

@Repository
public class PositionDAOImpl implements PositionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PositionDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPosition(Position p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Position saved successfully, Position Details="+p);
	}

	@Override
	public void updatePosition(Position p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Position updated successfully, Position Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Position> listPositions() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Position> positionsList = session.createQuery("from Position").list();
		for(Position p : positionsList){
			logger.info("Position List::"+p);
		}
		return positionsList;
	}

	@Override
	public Position getPositionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Position p = (Position) session.load(Position.class, new Integer(id));
		logger.info("Position loaded successfully, Position details="+p);
		return p;
	}

	@Override
	public void removePosition(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Position p = (Position) session.load(Position.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Position deleted successfully, position details="+p);
	}

}
