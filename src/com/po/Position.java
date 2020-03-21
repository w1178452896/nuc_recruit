package com.po;
import java.util.Date;
import com.common.Page;
public class Position extends Page{
	private static final long serialVersionUID = 1L;
	private int pid;
	private int cid;
	private String position;
	private String workplace;
	private String classification;
	private String department;
	private String salary;
	private String eduRequest;
	private String experience;
	private String statement;
	private String email;
	private int browsingNumber;
	private Date releaseDate;
	private String state;
	private Date deadline;;
	private Position positionList;
	
	public Position() {
		super();
	}
	public Position(String position, String workplace, String classification,
			String salary, String eduRequest, String experience) {
		super();
		this.position = position;
		this.workplace = workplace;
		this.classification = classification;
		this.salary = salary;
		this.eduRequest = eduRequest;
		this.experience = experience;
	}
	public Position getPositionList() {
		return positionList;
	}
	
	public void setPositionList(Position positionList) {
		this.positionList = positionList;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkplace() {
		return workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getBrowsingNumber() {
		return browsingNumber;
	}
	public void setBrowsingNumber(int browsingNumber) {
		this.browsingNumber = browsingNumber;
	}
	public String getEduRequest() {
		return eduRequest;
	}
	public void setEduRequest(String eduRequest) {
		this.eduRequest = eduRequest;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
}