package com.mapper;

import java.util.List;

import com.po.MajorSkill;

/**
 * MajorSkillMapper
 * @author superJJ
 *
 */
public interface MajorSkillMapper {
	/**
	 * 查找全部技能
	 * @param uid
	 * @return
	 */
	public List<MajorSkill> findAllMajorSkill(int uid);
	/**
	 * 通过id删除技能
	 * @param mid
	 */
	public void deleteMajorSkill(int mid);
	/**
	 * 更新技能
	 * @param majorSkill
	 */
	public void updateMajorSkill(MajorSkill majorSkill);
	/**
	 * 添加技能
	 * @param majorSkill
	 */
	public void insertMajorSkill(MajorSkill majorSkill);
}
