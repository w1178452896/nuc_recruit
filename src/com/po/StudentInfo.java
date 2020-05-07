package com.po;

import java.util.Calendar;
import java.util.Date;


public class StudentInfo extends Resume{

	private String password;
	private String sno;

	public StudentInfo() {
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

}
