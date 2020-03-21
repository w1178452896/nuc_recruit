package com.services;

import com.po.CompanyInfo;

public interface CompanyInfoService {
	public CompanyInfo findCompanyInfo(int ciid) throws Exception;
	public void addCompanyInfo(CompanyInfo companyInfo) throws Exception;
	public void updateCompanyInfo(CompanyInfo companyInfo) throws Exception;
	public CompanyInfo findCompanyInfoByName(String companyName) throws Exception;
}
