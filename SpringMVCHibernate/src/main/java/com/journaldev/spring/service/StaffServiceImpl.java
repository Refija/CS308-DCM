package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.StaffDAO;
import com.journaldev.spring.model.Staff;

@Service
public class StaffServiceImpl implements StaffService {
	
	private StaffDAO staffDAO;

	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}

	@Override
	@Transactional
	public void addStaff(Staff u) {
		this.staffDAO.addStaff(u);
	}

	@Override
	@Transactional
	public void updateStaff(Staff u) {
		this.staffDAO.updateStaff(u);
	}

	@Override
	@Transactional
	public List<Staff> listStaff() {
		return this.staffDAO.listStaff();
	}

	@Override
	@Transactional
	public Staff getStaffById(int id) {
		return this.staffDAO.getStaffById(id);
	}

	@Override
	@Transactional
	public void removeStaff(int id) {
		this.staffDAO.removeStaff(id);
	}

}
