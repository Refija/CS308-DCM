package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.ReportDAO;
import com.journaldev.spring.model.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	private ReportDAO reportDAO;

	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}

	@Override
	@Transactional
	public void addReport(Report p) {
		this.reportDAO.addReport(p);
	}

	@Override
	@Transactional
	public void updateReport(Report p) {
		this.reportDAO.updateReport(p);
	}

	@Override
	@Transactional
	public List<Report> listReports() {
		return this.reportDAO.listReports();
	}

	@Override
	@Transactional
	public Report getReportById(int id) {
		return this.reportDAO.getReportById(id);
	}

	@Override
	@Transactional
	public void removeReport(int id) {
		this.reportDAO.removeReport(id);
	}

}
