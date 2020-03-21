package com.mapper;

import java.util.List;

import com.po.Project;

/**
 * ProjectMapper
 * @author superJJ
 *
 */
public interface ProjectMapper {
	/**
	 * 查找全部项目
	 * @param uid
	 * @return
	 */
	public List<Project> findAllProject(int uid);
	/**
	 * 通过id删除项目
	 * @param pid
	 */
	public void deleteProject(int pid);
	/**
	 * 更新项目
	 * @param project
	 */
	public void updateProject(Project project);
	/**
	 * 添加项目
	 * @param project
	 */
	public void insertProject(Project project);
}
