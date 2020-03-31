package com.services;

import com.po.Admin;
import com.po.CompanyInfo;

import java.util.List;

public interface AdminService {

	//查找所有
	public List<Admin> getAll();

	//根据用户名查找
	public Admin findByUserName(String username);

	public void update(Admin admin);

	public void insert(Admin admin);

}
