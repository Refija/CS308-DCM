package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Report;

@Repository
public class ReportDAOImpl implements ReportDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addReport(Report p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Report saved successfully, Report Details="+p);
	}

	@Override
	public void updateReport(Report p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Report updated successfully, Report Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Report> listReports() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Report> reportsList = session.createQuery("from Report").list();
		for(Report p : reportsList){
			logger.info("Report List::"+p);
		}
		return reportsList;
	}

	@Override
	public Report getReportById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Report p = (Report) session.load(Report.class, new Integer(id));
		logger.info("Report loaded successfully, Report details="+p);
		return p;
	}

	@Override
	public void removeReport(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Report p = (Report) session.load(Report.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Report deleted successfully, report details="+p);
	}

}
