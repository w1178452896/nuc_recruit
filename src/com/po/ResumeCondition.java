package com.po;
import com.common.Page;
public class ResumeCondition extends Page{
	private static final long serialVersionUID = 1L;
	private String[] key;
	private String education;
	private String workYear;
	private String exceptedCity;
	private String positionApplied;
	public String[] getKey() {
		return key;
	}
	public void setKey(String[] key) {
		this.key = key;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getWorkYear() {
		return workYear;
	}
	public void setWorkYear(String workYear) {
		this.workYear = workYear;
	}
	public String getExceptedCity() {
		return exceptedCity;
	}
	public void setExceptedCity(String exceptedCity) {
		this.exceptedCity = exceptedCity;
	}
	public String getPositionApplied() {
		return positionApplied;
	}
	public void setPositionApplied(String positionApplied) {
		this.positionApplied = positionApplied;
	}
}
