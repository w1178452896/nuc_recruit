package com.po;

import java.util.Date;

public class EducationExperience {
	
	private int eid;
	private int uid;
	private String school;
	private String college;
	private String major;
	private String education;
	private Date stime;
	private Date etime;
	private String statement;
	public EducationExperience() {
		super();
	}
	public EducationExperience(int eid, int uid, String school, String college,
			String major, String education, Date stime, Date etime,
			String statement) {
		super();
		this.eid = eid;
		this.uid = uid;
		this.school = school;
		this.college = college;
		this.major = major;
		this.education = education;
		this.stime = stime;
		this.etime = etime;
		this.statement = statement;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public Date getStime() {
		return stime;
	}
	public void setStime(Date stime) {
		this.stime = stime;
	}
	public Date getEtime() {
		return etime;
	}
	public void setEtime(Date etime) {
		this.etime = etime;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	@Override
	public String toString() {
		return "EducationExperience [eid=" + eid + ", uid=" + uid + ", school="
				+ school + ", college=" + college + ", major=" + major
				+ ", education=" + education + ", stime=" + stime
				+ ", etime=" + etime + ", statement=" + statement + "]";
	}
	
}
