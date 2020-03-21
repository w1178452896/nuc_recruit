package com.services;

import java.util.List;


import com.po.PracticalExperience;

public interface PracticalExperienceService {
	/**
	 * 查找全部实习经历
	 * @param uid
	 * @return 实习经历List
	 * @throws Exception
	 */
	public List<PracticalExperience> findAllPracticalExperience(int uid) throws Exception;
	/**
	 * 通过id删除实习经历
	 * @param peid
	 * @throws Exception
	 */
	public void deletePracticalExperience(int peid) throws Exception;
	/**
	 * 更新实习经历
	 * @param praticalExperience
	 * @throws Exception
	 */
	public void updatePracticalExperience(PracticalExperience praticalExperience) throws Exception;
	/**
	 * 添加实习经历
	 * @param praticalExperience
	 * @throws Exception
	 */
	public void insertPracticalExperience(PracticalExperience praticalExperience) throws Exception;
}
