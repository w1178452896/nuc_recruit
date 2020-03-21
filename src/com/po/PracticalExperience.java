package com.po;

import java.util.Date;

public class PracticalExperience {
	private int peid;
	private int uid;
	private String company;
	private String position;
	private Date stime;
	private Date etime;
	public PracticalExperience() {
		super();
	}
	public PracticalExperience(int peid, int uid, String company,
			String position, Date stime, Date etime) {
		super();
		this.peid = peid;
		this.uid = uid;
		this.company = company;
		this.position = position;
		this.stime = stime;
		this.etime = etime;
	}
	public int getPeid() {
		return peid;
	}
	public void setPeid(int peid) {
		this.peid = peid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
	@Override
	public String toString() {
		return "PracticalExperience [peid=" + peid + ", uid=" + uid
				+ ", company=" + company + ", position=" + position
				+ ", stime=" + stime + ", etime=" + etime + "]";
	}
	
	

}
