package com.po;

import java.util.Date;

public class Project {
	private int pid;
	private int uid;
	private String project;
	private String position;
	private Date stime;
	private Date etime;
	private String statement;
	
	public Project() {
	}

	public Project(int pid, int uid, String project, String position,
			Date stime, Date etime, String statement) {
		super();
		this.pid = pid;
		this.uid = uid;
		this.project = project;
		this.position = position;
		this.stime = stime;
		this.etime = etime;
		this.statement = statement;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
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

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	@Override
	public String toString() {
		return "Project [pid=" + pid + ", uid=" + uid + ", project=" + project
				+ ", position=" + position + ", stime=" + stime + ", etime="
				+ etime + ", statement=" + statement + "]";
	}

	
	
}
