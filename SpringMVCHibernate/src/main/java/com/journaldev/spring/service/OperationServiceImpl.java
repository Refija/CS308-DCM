package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.OperationDAO;
import com.journaldev.spring.model.Operation;

@Service
public class OperationServiceImpl implements OperationService {
	
	private OperationDAO operationDAO;

	public void setOperationDAO(OperationDAO operationDAO) {
		this.operationDAO = operationDAO;
	}

	@Override
	@Transactional
	public void addOperation(Operation p) {
		this.operationDAO.addOperation(p);
	}

	@Override
	@Transactional
	public void updateOperation(Operation p) {
		this.operationDAO.updateOperation(p);
	}

	@Override
	@Transactional
	public List<Operation> listOperations() {
		return this.operationDAO.listOperations();
	}

	@Override
	@Transactional
	public Operation getOperationById(int id) {
		return this.operationDAO.getOperationById(id);
	}

	@Override
	@Transactional
	public void removeOperation(int id) {
		this.operationDAO.removeOperation(id);
	}

}
