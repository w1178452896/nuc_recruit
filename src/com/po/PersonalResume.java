package com.po;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
public class PersonalResume extends Resume{
	private String workYear;
	private String school;
	private String major;
	private int age;
	private  String education;
	private String to;
	private String subject;
	private String message;
	private List<Integer> idArr;
	private List<MajorSkill> majorSkillList;
	private List<Project> projectList;
	private List<PracticalExperience> practicalExperienceList;
	private List<EducationExperience> educationExperienceList;
	public List<Integer> getIdArr() {
		return idArr;
	}
	public void setIdArr(List<Integer> idArr) {
		this.idArr = idArr;
	}
	@Override
	public String getEducation(){
		return education;
	}
	@Override
	public void setEducation(String education){
		this.education = education;
	}
	@Override
	public void setWorkYear(String workYear){
		if(workYear.equals("1")){
			this.workYear = "无";
		}else if(workYear.equals("2")){
			this.workYear = "1-3月";
		}else if(workYear.equals("3")){
			this.workYear = "3-6月";
		}else if(workYear.equals("4")){
			this.workYear = "6-12月";
		}else{
			this.workYear = "1年以上";
		}
	}
	@Override
	public String getWorkYear(){
		return this.workYear;
	}
	public List<MajorSkill> getMajorSkillList() {
		return majorSkillList;
	}
	public void setMajorSkillList(List<MajorSkill> majorSkillList) {
		this.majorSkillList = majorSkillList;
	}
	public List<Project> getProjectList() {
		return projectList;
	}
	public void setProjectList(List<Project> projectList) {
		this.projectList = projectList;
	}
	public List<PracticalExperience> getPracticalExperienceList() {
		return practicalExperienceList;
	}
	public void setPracticalExperienceList(
			List<PracticalExperience> practicalExperienceList) {
		this.practicalExperienceList = practicalExperienceList;
	}
	public List<EducationExperience> getEducationExperienceList() {
		return educationExperienceList;
	}
	public void setEducationExperienceList(
			List<EducationExperience> educationExperienceList) {
		this.educationExperienceList = educationExperienceList;
	}
	@Override
	public int getAge() {
	   Calendar calendar = Calendar.getInstance();
	   calendar.setTime(getBirthday());
	   int brithday = calendar.get(Calendar.YEAR);
	   calendar.setTime(new Date());
	   int today = calendar.get(Calendar.YEAR);
	   this.age = today - brithday +1;
	   return age;
	}
	@Override
	public void setAge(int age) {
		this.age = age;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
