package com.services;

import com.common.Page;
import com.mapper.AdminMapper;
import com.mapper.CompanyInfoMapper;
import com.po.Admin;
import com.po.CompanyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 
 * @author
 *
 */
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public List<Admin> getAll() {
		return adminMapper.getAll();
	}

	@Override
	public Admin findByUserName(String username) {
		return adminMapper.findByUserName(username);
	}

	@Override
	public void update(Admin admin) {
		adminMapper.update(admin);
	}

	@Override
	public void insert(Admin admin) {
		adminMapper.insert(admin);
	}

	@Override
	public void delete(int id) {
		adminMapper.delete(id);
	}

	@Override
	public int findCount() {
		return adminMapper.findCount();
	}

	@Override
	public List<Admin> findAdmin(Page page) {
		return adminMapper.findAdmin(page);
	}
}
