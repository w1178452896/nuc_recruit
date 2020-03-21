package com.services;

import java.util.List;

import com.po.MajorSkill;

public interface MajorSkillService {
	/**
	 * 查找全部技能
	 * @param uid
	 * @return 技能List
	 * @throws Exception
	 */
	public List<MajorSkill> findAllMajorSkill(int uid) throws Exception;
	/**
	 * 通过id删除技能
	 * @param mid
	 * @throws Exception
	 */
	public void deleteMajorSkill(int mid) throws Exception;
	
	/**
	 * 更新技能
	 * @param majorSkill
	 * @throws Exception
	 */
	public void updateMajorSkill(MajorSkill majorSkill) throws Exception;
	
	/**
	 * 添加技能
	 * @param majorSkill
	 * @throws Exception
	 */
	public void insertMajorSkill(MajorSkill majorSkill) throws Exception;
}
