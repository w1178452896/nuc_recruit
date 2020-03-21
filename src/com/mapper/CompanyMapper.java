package com.mapper;

import java.util.List;

import com.po.Company;
/**
 * 
 * @author 梁铭新
 */
public interface CompanyMapper {
	/**
	 * 通过账号查找用户
	 * @param mail
	 * @return
	 * @throws Exception
	 */
     public Company findCompanyByMail(String mail) throws Exception;
     
	 /**
	  * 查找所有用户
	  * @return
	  * @throws Exception
	  */
	 public List<Company> findAllCompany()throws Exception;
     
     /**
      * 用户注册
      * @param company
      * @throws Exception
      */
     public void addCompany(Company company) throws Exception;
     
     /**
      * 修改密码
      * @param company
      * @throws Exception
      */
     public void updatePassword(Company company) throws Exception;
     
     /**
      * 修改激活状态
      * @param company
      * @throws Exception
      */
	 public void updateState(Company company)throws Exception;
	 
	 
}
