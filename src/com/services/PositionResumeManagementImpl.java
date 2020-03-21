package com.services;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PositionResumeManagementMapper;
import com.po.PersonalResume;
import com.po.PositionResume;
import com.po.PositionResumeManagement;
import com.po.ShowPositionResume;
/**
 * @author lcy
 * @time 2016/7/8
 */
@Service("positionResumeManagementService")
public class PositionResumeManagementImpl implements PositionResumeManagementService{
    @Autowired
    PositionResumeManagementMapper positionResumeManagementMapper;
    @Autowired
    CommonService commonService;
	@Override
	public ShowPositionResume findPositionResume(ShowPositionResume showPositionResume)
			throws Exception {
		return this.positionResumeManagementMapper.findPositionResume(showPositionResume);
	}
	@Override
	public List<PositionResumeManagement> findPositionByCid(PositionResumeManagement positionResumeManagement) throws Exception {
		return this.positionResumeManagementMapper.findPositionByCid(positionResumeManagement);
	}
	@Override
	public int findPositionByCidCount(
			PositionResumeManagement positionResumeManagement) throws Exception {
		return this.positionResumeManagementMapper.findPositionByCidCount(positionResumeManagement);
	}
	@Override
	public int findPositionResumeCount(ShowPositionResume showPositionResume)
			throws Exception {
		return this.positionResumeManagementMapper.findPositionResumeCount(showPositionResume);
	}
	@Override
	public List<PersonalResume> findPersonalResume(List<Integer> uidSet)
			throws Exception {
		List<PersonalResume> personalResume; 
		personalResume = this.positionResumeManagementMapper.findPersonalResume(uidSet);
		for (int i = 0; i < personalResume.size(); i++) {
			if(!personalResume.get(i).getEducationExperienceList().isEmpty()){
				personalResume.get(i).setSchool(personalResume.get(i).getEducationExperienceList().get(0).getSchool());
				personalResume.get(i).setMajor(personalResume.get(i).getEducationExperienceList().get(0).getMajor());
			    for (int j = 0; j < personalResume.get(i).getEducationExperienceList().size(); j++) {
			    	String education = personalResume.get(i).getEducationExperienceList().get(j).getEducation();
			    	if(education!=null && education.equals("1")){
						education = "大专";
					}else if(education!=null && education.equals("2")){
						education = "本科";
					}else if(education!=null && education.equals("3")){
						education = "硕士";
					}else if(education!=null && education.equals("4")){
						education = "博士";
					}else{
						education = "其他";
					}
			    	personalResume.get(i).getEducationExperienceList().get(j).setEducation(education);
				}
			    personalResume.get(i).setEducation(personalResume.get(i).getEducationExperienceList().get(0).getEducation());
			}	
		}
		return personalResume;
	}
	@Override
	public void updatePositionResume(Map<?, ?> map) throws Exception {
		this.positionResumeManagementMapper.updatePositionResume(map);
	}	
	@Override
	public void insertPositionResume(PositionResume positionResume){
		this.positionResumeManagementMapper.insertPositionResume(positionResume);
	}
}