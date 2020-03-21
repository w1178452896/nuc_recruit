package com.po;


public class MajorSkill {
	private int mid;
	private int uid;
	private String skill;
	
	public MajorSkill() {
	}

	public MajorSkill(int mid, int uid, String skill) {
		this.mid = mid;
		this.uid = uid;
		this.skill = skill;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}
	
	
}
