package com.po;
import com.common.Page;
/**
 * @author lcy
 * 企业简历管理模块
 */
public class PositionResumeManagement extends Page{
	private static final long serialVersionUID = 1L;
	private int pid;
	private int invitationNumber;//邀请简历数
	private int candidatesNumber;//收到简历数
	private Position position;
	public int getCandidatesNumber() {
		return candidatesNumber;
	}
	public void setCandidatesNumber(int candidatesNumber) {
		this.candidatesNumber = candidatesNumber;
	}
	public int getInvitationNumber() {
		return invitationNumber;
	}
	public void setInvitationNumber(int invitationNumber) {
		this.invitationNumber = invitationNumber;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
}