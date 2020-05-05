package com.po;

import com.common.Page;

import java.util.List;

/**
 * 职位对应简历，一对多的关系
 * @author lcy
 */
public class ShowCompanyResume extends Page{
	private static final long serialVersionUID = 1L;
	private int uid;
	private int pendingNumber;
	private int invitationNumber;
	private int refuseNumber;
	private String position;
	private String state;
	private List<CompanyResume> companyResume;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPendingNumber() {
		return pendingNumber;
	}
	public void setPendingNumber(int pendingNumber) {
		this.pendingNumber = pendingNumber;
	}
	public int getInvitationNumber() {
		return invitationNumber;
	}
	public void setInvitationNumber(int invitationNumber) {
		this.invitationNumber = invitationNumber;
	}
	public int getRefuseNumber() {
		return refuseNumber;
	}
	public void setRefuseNumber(int refuseNumber) {
		this.refuseNumber = refuseNumber;
	}
	public List<CompanyResume> getCompanyResume() {
		return companyResume;
	}
	public void setCompanyResume(List<CompanyResume> companyResume) {
		this.companyResume = companyResume;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
