package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PositionManagementMapper;
import com.po.Position;
@Service("PositionManagementService")
public class PositionManagerServiceImpl implements PositionManagementService {
	@Autowired
	PositionManagementMapper positionManagementMapper;
	
	@Override
	public void addPosition(Position position) throws Exception {
		// TODO Auto-generated method stub
		positionManagementMapper.addPosition(position);
	}

	@Override
	public List<Position> findPosition(Position position) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.findPosition(position);
	}

	@Override
	public Position showPosition(int pid) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.showPosition(pid);
	}

	@Override
	public void deletePosition(Integer[] positionPid) throws Exception {
		// TODO Auto-generated method stub
		positionManagementMapper.deletePosition(positionPid);
	}

	@Override
	public List<Position> findOnPosition(Position position) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.findOnPosition(position);
	}

	@Override
	public List<Position> findOverPosition(Position position) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.findOverPosition(position);
	}

	@Override
	public int countByCid(int cid) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.countByCid(cid);
	}

	@Override
	public int countOnByCid(int cid) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.countOnByCid(cid);
	}

	@Override
	public int countOverByCid(int cid) throws Exception {
		// TODO Auto-generated method stub
		return positionManagementMapper.countOverByCid(cid);
	}

	@Override
	public void endPosition(Integer[] positionPid) throws Exception {
		// TODO Auto-generated method stub
		positionManagementMapper.endPosition(positionPid);
	}

}
