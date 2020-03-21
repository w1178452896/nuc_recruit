package com.services;

import java.util.List;

import com.po.Project;


public interface ProjectService {
	/**
	 * 查找全部项目
	 * @param uid
	 * @return 项目List
	 * @throws Exception
	 */
	public List<Project> findAllProject(int uid) throws Exception;
	/**
	 * 通过id删除项目
	 * @param pid
	 * @throws Exception
	 */
	public void deleteProject(int pid) throws Exception;
	/**
	 * 更新项目
	 * @param project
	 * @throws Exception
	 */
	public void updateProject(Project project) throws Exception;
	/**
	 * 添加项目
	 * @param project
	 * @throws Exception
	 */
	public void insertProject(Project project) throws Exception;
}
