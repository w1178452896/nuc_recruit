package com.services;

import java.util.List;

import com.po.Position;

public interface PositionManagementService {
	public void addPosition(Position position) throws Exception;
	public List<Position> findPosition(Position position)throws Exception;
	public List<Position> findOnPosition(Position position)throws Exception;
	public List<Position> findOverPosition(Position position)throws Exception;
	public Position showPosition(int pid) throws Exception;
	public void deletePosition(Integer[] positionPid) throws Exception;
	public void endPosition(Integer[] positionPid) throws Exception;
	public int countByCid(int cid) throws Exception;
	public int countOnByCid(int cid) throws Exception;
	public int countOverByCid(int cid) throws Exception;
}
