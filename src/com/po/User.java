package com.po;

import java.util.Date;
import java.util.List;

public class User {
	
	private int uid;
	private String password;
	private String code;
	private String mail;
	private Date registerTime;
	private String state;
	private String sno;
	private Resume resume;
	private List<EducationExperience> educationExperience;
	private List<Project> project;
	private List<PracticalExperience> practicalExperience;
	private List<MajorSkill> majorSkill;
	
	public User() {
		super();
	}

	public User(int uid, String password, String code,
			String mail, Date registerTime, String state, Resume resume,
			List<EducationExperience> educationExperience,
			List<Project> project, List<PracticalExperience> practicalExperience,
			List<MajorSkill> majorSkill) {
		super();
		this.uid = uid;
		this.password = password;
		this.code = code;
		this.mail = mail;
		this.registerTime = registerTime;
		this.state = state;
		this.resume = resume;
		this.educationExperience = educationExperience;
		this.project = project;
		this.practicalExperience = practicalExperience;
		this.majorSkill = majorSkill;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public List<EducationExperience> getEducationExperience() {
		return educationExperience;
	}

	public void setEducationExperience(List<EducationExperience> educationExperience) {
		this.educationExperience = educationExperience;
	}

	public List<Project> getProject() {
		return project;
	}

	public void setProject(List<Project> project) {
		this.project = project;
	}

	public List<PracticalExperience> getPracticalExperience() {
		return practicalExperience;
	}

	public void setPracticalExperience(List<PracticalExperience> practicalExperience) {
		this.practicalExperience = practicalExperience;
	}

	public List<MajorSkill> getMajorSkill() {
		return majorSkill;
	}

	public void setMajorSkill(List<MajorSkill> majorSkill) {
		this.majorSkill = majorSkill;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	@Override
	public String toString() {
		return "User{" +
				"uid=" + uid +
				", password='" + password + '\'' +
				", code='" + code + '\'' +
				", mail='" + mail + '\'' +
				", registerTime=" + registerTime +
				", state='" + state + '\'' +
				", sno='" + sno + '\'' +
				", resume=" + resume +
				", educationExperience=" + educationExperience +
				", project=" + project +
				", practicalExperience=" + practicalExperience +
				", majorSkill=" + majorSkill +
				'}';
	}


}
