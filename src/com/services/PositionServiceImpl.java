package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PositionMapper;
import com.po.Position;

@Service("PositionService")
public class PositionServiceImpl implements PositionService{
	
	@Autowired
	PositionMapper positionMapper;

	@Override
	public List<Position> findPosition(Position position) {
		return positionMapper.findPosition(position);
	}

	@Override
	public int findPositionCount(Position position) {
		return positionMapper.findPositionCount(position);
	}

	@Override
	public List<Position> findAllPosition() {
		return positionMapper.findAllPosition();
	}

	@Override
	public List<Position> findPositionByCondition(Position position) {
		return positionMapper.findPositionByCondition(position);
	}

	@Override
	public int findPositionByConditionCount(Position position) {
		return positionMapper.findPositionByConditionCount(position);
	}

	@Override
	public void deleteByPid(int pid) {
		positionMapper.deleteByPid(pid);
	}
	
}
