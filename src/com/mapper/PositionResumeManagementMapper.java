package com.mapper;
import java.util.List;
import java.util.Map;

import com.po.PersonalResume;
import com.po.PositionResume;
import com.po.PositionResumeManagement;
import com.po.ShowPositionResume;
/**
 * @author lcy
 */
public interface PositionResumeManagementMapper {
	/**
	 * 按部门搜索职位等信息
	 * @return List<PositionResumeManagement>  部门集合
	 */
	public List<PositionResumeManagement> findPositionByCid(PositionResumeManagement positionResumeManagement);
	/**
	 * 按部门搜索职位等信息返回总数
	 * @param positionResumeManagement 
	 * @return int 返回总数
	 */
	public int findPositionByCidCount(PositionResumeManagement positionResumeManagement);
	/**
     * 查找对应职位的简历
     * @param showPositionResume  包含职位Id和简历状态
     * @return ShowPositionResume
     */
	public ShowPositionResume findPositionResume(ShowPositionResume showPositionResume);
	/**
	 * @param showPositionResume
	 * @return int 返回数据库记录数，用于分页
	 */
	public int findPositionResumeCount(ShowPositionResume showPositionResume);
	/**
	 * 查找需要导出的简历数据
	 * @param uidSet uid数组
	 * @return 简历集合
	 */
	public List<PersonalResume> findPersonalResume(List<Integer> uidSet);
	/**
	 * 更新PositionResume
	 * @param map
	 */
	public void updatePositionResume(Map<?, ?> map);
	/**
	 * 插入简历职位信息
	 * @param positionResumeManagement
	 */
	public void insertPositionResume(PositionResume positionResume);
}
