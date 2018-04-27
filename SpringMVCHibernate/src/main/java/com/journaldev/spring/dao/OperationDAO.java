package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Operation;

public interface OperationDAO {

	public void addOperation(Operation p);
	public void updateOperation(Operation p);
	public List<Operation> listOperations();
	public Operation getOperationById(int id);
	public void removeOperation(int id);
}
