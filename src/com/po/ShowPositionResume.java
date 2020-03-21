package com.po;
import java.util.List;
import com.common.Page;
/**
 * 职位对应简历，一对多的关系
 * @author lcy
 */
public class ShowPositionResume extends Page{
	private static final long serialVersionUID = 1L;
	private int pid;
	private int pendingNumber;
	private int invitationNumber;
	private int refuseNumber;
	private String position;
	private String state;
	private List<PositionResume> positionResume;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public List<PositionResume> getPositionResume() {
		return positionResume;
	}
	public void setPositionResume(List<PositionResume> positionResume) {
		this.positionResume = positionResume;
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
