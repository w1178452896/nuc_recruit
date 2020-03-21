package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.EducationExperienceMapper;
import com.po.EducationExperience;

@Service("EducationExperienceService")
public class EducationExperienceServiceImpl implements
		EducationExperienceService {

	@Autowired
	private EducationExperienceMapper educationExperienceMapper;
	
	@Override
	public List<EducationExperience> findAllEducationExperience(int uid) {
		return this.educationExperienceMapper.findAllEducationExperience(uid);
	}

	@Override
	public void deleteEducationExperience(int eid) {
		this.educationExperienceMapper.deleteEducationExperience(eid);
	}

	@Override
	public void updateEducationExperience(
			EducationExperience educationExperience) {
		this.educationExperienceMapper.updateEducationExperience(educationExperience);
	}

	@Override
	public void insertEducationExperience(
			EducationExperience educationExperience) {
		this.educationExperienceMapper.insertEducationExperience(educationExperience);
	}

}
