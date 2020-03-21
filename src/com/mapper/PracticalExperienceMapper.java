package com.mapper;

import java.util.List;


import com.po.PracticalExperience;

/**
 * PracticalExperienceMapper
 * @author superJJ
 *
 */
public interface PracticalExperienceMapper {
	/**
	 * 查找全部实习经历
	 * @param uid
	 * @return
	 */
	public List<PracticalExperience> findAllPracticalExperience(int uid);
	/**
	 * 通过id删除实习经历
	 * @param peid
	 */
	public void deletePracticalExperience(int peid);
	/**
	 * 更新实习经历
	 * @param practicalExperience
	 */
	public void updatePracticalExperience(PracticalExperience practicalExperience);
	/**
	 * 添加实习经历
	 * @param practicalExperience
	 */
	public void insertPracticalExperience(PracticalExperience practicalExperience);
}
