package com.mapper;

import com.po.CompanyInfo;
/**
 * 
 * @author 梁铭新
 */
public interface CompanyInfoMapper {

	/**
	 * 根据ciid查找公司信息
	 * @param ciid
	 * @return
	 * @throws Exception
	 */
	public CompanyInfo findCompanyInfo(int ciid) throws Exception;
	
	/**
	 * 添加公司信息
	 * @param companyInfo
	 * @throws Exception
	 */
	public void addCompanyInfo(CompanyInfo companyInfo) throws Exception;
	
	/**
	 * 修改公司信息
	 * @param companyInfo
	 * @throws Exception
	 */
	public void updateCompanyInfo(CompanyInfo companyInfo) throws Exception;
	
	/**
	 * 根据公司名companyName查找公司信息
	 * @param companyName
	 * @return
	 * @throws Exception
	 */
	public CompanyInfo findCompanyInfoByName(String companyName) throws Exception;
		
}
