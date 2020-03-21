package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ProjectMapper;
import com.po.Project;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectMapper projectMapper;
	@Override
	public List<Project> findAllProject(int uid) {
		return projectMapper.findAllProject(uid);
	}

	@Override
	public void deleteProject(int pid) {
		projectMapper.deleteProject(pid);
	}

	@Override
	public void updateProject(Project project) {
		projectMapper.updateProject(project);
	}

	@Override
	public void insertProject(Project project) {
		projectMapper.insertProject(project);
	}

}
