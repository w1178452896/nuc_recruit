package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.CompanyInfoMapper;
import com.po.CompanyInfo;
/**
 * 
 * @author
 *
 */
@Service("CompanyInfoService")
public class CompanyInfoServiceImpl implements CompanyInfoService {
	@Autowired
	CompanyInfoMapper companyInfoMapper;
	
	@Override
	public CompanyInfo findCompanyInfo(int ciid) throws Exception {
		// TODO Auto-generated method stub
		return companyInfoMapper.findCompanyInfo(ciid);
	}

	@Override
	public void addCompanyInfo(CompanyInfo companyInfo) throws Exception {
		// TODO Auto-generated method stub
		companyInfoMapper.addCompanyInfo(companyInfo);
	}

	@Override
	public void updateCompanyInfo(CompanyInfo companyInfo) throws Exception {
		// TODO Auto-generated method stub
		companyInfoMapper.updateCompanyInfo(companyInfo);
	}

	@Override
	public CompanyInfo findCompanyInfoByName(String companyName)
			throws Exception {
		// TODO Auto-generated method stub
		return companyInfoMapper.findCompanyInfoByName(companyName);
	}

}
