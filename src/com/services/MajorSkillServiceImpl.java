package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.MajorSkillMapper;
import com.po.MajorSkill;

@Service("majorSkillSerivce")
public class MajorSkillServiceImpl implements MajorSkillService {
	
	@Autowired
	private MajorSkillMapper majorSkillMapper;
	
	@Override
	public List<MajorSkill> findAllMajorSkill(int uid) {
		return this.majorSkillMapper.findAllMajorSkill(uid);
	}

	@Override
	public void deleteMajorSkill(int mid) {
		this.majorSkillMapper.deleteMajorSkill(mid);
	}

	@Override
	public void updateMajorSkill(MajorSkill majorSkill) {
		this.majorSkillMapper.updateMajorSkill(majorSkill);
	}

	@Override
	public void insertMajorSkill(MajorSkill majorSkill) {
		this.majorSkillMapper.insertMajorSkill(majorSkill);
	}

}
