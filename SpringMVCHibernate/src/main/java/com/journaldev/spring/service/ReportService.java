package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Report;

public interface ReportService {

	public void addReport(Report p);
	public void updateReport(Report p);
	public List<Report> listReports();
	public Report getReportById(int id);
	public void removeReport(int id);
	
}
