package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Position;

public interface PositionDAO {

	public void addPosition(Position p);
	public void updatePosition(Position p);
	public List<Position> listPositions();
	public Position getPositionById(int id);
	public void removePosition(int id);
}
