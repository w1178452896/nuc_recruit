package com.po;

import java.util.Calendar;
import java.util.Date;


public class Resume {
	private int uid;
	private String name;
	private String sex;
	private String nativePlace;
	private Date birthday;
	private String education;
	private String workYear;
	private String phone;
	private String idCard;
	private String mail;
	private String city;
	private String personPic;
	private String introduction;
	private String positionApplied;
	private String exceptedCity;
	private double exceptedSalary;
	private String postscript;
	private int age;
	public Resume() {
	}

	public Resume(int uid, String name, String sex, String nativePlace,
			Date birthday, String education, String workYear, String phone,
			String idCard, String mail, String city, String personPic,
			String introduction, String positionApplied, String exceptedCity,
			double exceptedSalary, String postscript) {
		super();
		this.uid = uid;
		this.name = name;
		this.sex = sex;
		this.nativePlace = nativePlace;
		this.birthday = birthday;
		this.education = education;
		this.workYear = workYear;
		this.phone = phone;
		this.idCard = idCard;
		this.mail = mail;
		this.city = city;
		this.personPic = personPic;
		this.introduction = introduction;
		this.positionApplied = positionApplied;
		this.exceptedCity = exceptedCity;
		this.exceptedSalary = exceptedSalary;
		this.postscript = postscript;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNativePlace() {
		return nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPersonPic() {
		return personPic;
	}

	public void setPersonPic(String personPic) {
		this.personPic = personPic;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPositionApplied() {
		return positionApplied;
	}

	public void setPositionApplied(String positionApplied) {
		this.positionApplied = positionApplied;
	}

	public String getExceptedCity() {
		return exceptedCity;
	}

	public void setExceptedCity(String exceptedCity) {
		this.exceptedCity = exceptedCity;
	}

	public double getExceptedSalary() {
		return exceptedSalary;
	}

	public void setExceptedSalary(double exceptedSalary) {
		this.exceptedSalary = exceptedSalary;
	}

	public String getPostscript() {
		return postscript;
	}

	public void setPostscript(String postscript) {
		this.postscript = postscript;
	}

	@Override
	public String toString() {
		return "Resume [uid=" + uid + ", name=" + name + ", sex=" + sex
				+ ", nativePlace=" + nativePlace + ", birthday=" + birthday
				+ ", education=" + education + ", workYear=" + workYear
				+ ", phone=" + phone + ", idCard=" + idCard + ", mail="
				+ mail + ", city=" + city + ", personPic=" + personPic
				+ ", introduction=" + introduction + ", positionApplied="
				+ positionApplied + ", exceptedCity=" + exceptedCity
				+ ", exceptedSalary=" + exceptedSalary + ", postscript="
				+ postscript + "]";
	}

	public int getAge() {
	    Calendar calendar = Calendar.getInstance();
		calendar.setTime(getBirthday());
		int brithday = calendar.get(Calendar.YEAR);
		calendar.setTime(new Date());
		int today = calendar.get(Calendar.YEAR);
		this.age = today - brithday +1;
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}
