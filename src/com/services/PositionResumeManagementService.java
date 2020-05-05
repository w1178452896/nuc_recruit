package com.services;
import java.util.List;
import java.util.Map;

import com.po.*;

/**
 * @author lcy
 * @time 2016/7/8
 */
public interface PositionResumeManagementService {
	/**
	 * 按部门搜索职位等信息
	 * @param position.department  部门
	 * @param position.cid 公司ID
	 * @return  List<PositionResumeManagement> 部门集合
	 * @throws Exception
	 */
	public List<PositionResumeManagement> findPositionByCid(PositionResumeManagement positionResumeManagement)throws Exception;
	
	/**
	 * 按部门搜索职位等信息返回总数，方便分页
	 * @param positionResumeManagement 
	 * @return 查找总数
	 * @throws Exception
	 */
	public int findPositionByCidCount(PositionResumeManagement positionResumeManagement)throws Exception;
	
	/**
	 * 按职位ID找简历
	 * @param ShowPositionResume
	 * @return ShowPositionResume 
	 * @throws Exception
	 */
	public ShowPositionResume findPositionResume(ShowPositionResume showPositionResume)throws Exception;


	public ShowCompanyResume findCompanyResume(ShowCompanyResume showCompanyResume)throws Exception;

	/**
	 * 按职位ID找简历 返回记录数
	 * @param showPositionResume
	 * @return int 返回数据库记录数
	 * @throws Exception
	 */
	public int findPositionResumeCount(ShowPositionResume showPositionResume) throws Exception;

	public int findCompanyResumeCount(ShowCompanyResume showCompanyResume) throws Exception;
	/**
	 * 通过uid查找出个人简历的所有数据
	 * @param uidArray 
	 * @return List<PersonalResume>  PersonalResume的集合
	 * @throws Exception
	 */
	public List<PersonalResume> findPersonalResume(List<Integer> uidArray) throws Exception;
    /**
     * 更新简历状态
     * @param map
     * @throws Exception
     */
	public void updatePositionResume(Map<?,?> map) throws Exception;
	/**
	 * 插入简历职位信息
	 * @param positionResumeManagement
	 */
	public void insertPositionResume(PositionResume positionResume);

	public List<UserResume> findUserResume();
}

