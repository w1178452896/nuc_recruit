package com.mapper;

import java.util.List;

import com.po.EducationExperience;

/**
 * EducationExperienceMapper
 * @author superJJ
 *
 */
public interface EducationExperienceMapper {
	
	/**
	 * 查找全部教育经历
	 * @param uid
	 * @return
	 */
	public List<EducationExperience> findAllEducationExperience(int uid);
	/**
	 * 通过id删除教育经历
	 * @param eid
	 */
	public void deleteEducationExperience(int eid);
	/**
	 * 更新教育经历
	 * @param educationExperience
	 */
	public void updateEducationExperience(EducationExperience educationExperience);
	/**
	 * 添加教育经历
	 * @param educationExperience
	 */
	public void insertEducationExperience(EducationExperience educationExperience);
}
