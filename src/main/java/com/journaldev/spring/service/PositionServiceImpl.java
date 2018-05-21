package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.PositionDAO;
import com.journaldev.spring.model.Position;

@Service
public class PositionServiceImpl implements PositionService {
	
	private PositionDAO positionDAO;

	public void setPositionDAO(PositionDAO positionDAO) {
		this.positionDAO = positionDAO;
	}

	@Override
	@Transactional
	public void addPosition(Position p) {
		this.positionDAO.addPosition(p);
	}

	@Override
	@Transactional
	public void updatePosition(Position p) {
		this.positionDAO.updatePosition(p);
	}

	@Override
	@Transactional
	public List<Position> listPositions() {
		return this.positionDAO.listPositions();
	}

	@Override
	@Transactional
	public Position getPositionById(int id) {
		return this.positionDAO.getPositionById(id);
	}

	@Override
	@Transactional
	public void removePosition(int id) {
		this.positionDAO.removePosition(id);
	}

}
