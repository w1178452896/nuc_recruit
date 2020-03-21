package com.services;

import java.util.List;
import com.po.Company;

public interface CompanyService {
	
	public Company findCompanyByMail(String mail) throws Exception;
	public List<Company> findAllCompany()throws Exception;
	public void addCompany(Company company) throws Exception;
	public void updatePassword(Company company) throws Exception;
	public void updateState(Company company)throws Exception;
	public void validate(Company company,String type) throws Exception;
	public void activate(String mail,String code) throws Exception;
}
