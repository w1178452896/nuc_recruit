package com.services;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PracticalExperienceMapper;
import com.po.PracticalExperience;

@Service("PracticalExperienceService")
public class PracticalExperienceServiceImpl implements PracticalExperienceService {

	@Autowired
	private PracticalExperienceMapper practicalExperienceMapper;
	
	@Override
	public List<PracticalExperience> findAllPracticalExperience(int uid) {
		return practicalExperienceMapper.findAllPracticalExperience(uid);
	}

	@Override
	public void deletePracticalExperience(int peid) {
		practicalExperienceMapper.deletePracticalExperience(peid);
	}

	@Override
	public void updatePracticalExperience(PracticalExperience praticalExperience) {
		practicalExperienceMapper.updatePracticalExperience(praticalExperience);
	}

	@Override
	public void insertPracticalExperience(PracticalExperience praticalExperience) {
		practicalExperienceMapper.insertPracticalExperience(praticalExperience);
	}

}
