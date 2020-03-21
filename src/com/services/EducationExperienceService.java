package com.services;

import java.util.List;

import com.po.EducationExperience;

public interface EducationExperienceService {
	/**
	 * 查找全部教育经历
	 * @param uid
	 * @return 教育经历List
	 */
	public List<EducationExperience> findAllEducationExperience(int uid) throws Exception;
	
	/**
	 * 通过id删除教育经历
	 * @param eid
	 */
	public void deleteEducationExperience(int eid) throws Exception;
	
	/**
	 * 更新教育经历
	 * @param educationExperience
	 */
	public void updateEducationExperience(EducationExperience educationExperience) throws Exception;
	
	/**
	 * 添加教育经历
	 * @param educationExperience
	 * @throws Exception
	 */
	public void insertEducationExperience(EducationExperience educationExperience) throws Exception;
}
