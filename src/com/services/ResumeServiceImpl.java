package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ResumeMapper;
import com.po.Resume;
import com.po.ResumeCondition;

@Service("ResumeService")
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeMapper resumeMapper;
	
	@Override
	public List<Resume> findAllResume(int uid) {
		return resumeMapper.findAllResume(uid);
	}

	@Override
	public void deleteResume(int rid) {
		resumeMapper.deleteResume(rid);
	}

	@Override
	public void updateResume(Resume resume) {
		resumeMapper.updateResume(resume);
	}

	@Override
	public void insertResume(Resume resume) {
		resumeMapper.insertResume(resume);
	}

	@Override
	public List<Resume> findResume(ResumeCondition resumeCondition)
			throws Exception {
		
		return resumeMapper.findResume(resumeCondition);
	}

	@Override
	public int findResumeCount(ResumeCondition resumeCondition)
			throws Exception {
		return resumeMapper.findResumeCount(resumeCondition);
	}

}
