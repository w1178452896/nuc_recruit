package com.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.po.Company;
import com.po.CompanyInfo;
import com.services.CompanyInfoService;
import com.services.CompanyService;

/**
 * 
 * @author 梁铭新
 *
 */
@Controller
public class CompanyInfoController {
	@Autowired
	CompanyInfoService companyInfoService;
	
	@Autowired
	CompanyService companyService;
	
	/**
	 * 企业信息添加
	 * @param model
	 * @param request
	 * @param companyName
	 * @param location
	 * @param address
	 * @param industry
	 * @param contacts
	 * @param sex
	 * @param phone
	 * @param telephone
	 * @param companyInstruction
	 * @param session
	 * @param logopic
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyInfoAdd",method={RequestMethod.POST,RequestMethod.GET})
	public String companyInfoAdd(Model model,HttpServletRequest request,String companyName,
				String location,String address,String industry,String contacts,String sex,String phone,
				String telephone,String companyInstruction,HttpSession session,MultipartFile logopic) throws Exception{
		int ciid=(int) session.getAttribute("cid");
		CompanyInfo companyInfo=new CompanyInfo();
		companyInfo.setCiid(ciid);
		companyInfo.setCompanyName(companyName);
		companyInfo.setLocation(location);
		companyInfo.setAddress(address);
		companyInfo.setIndustry(industry);
		companyInfo.setContacts(contacts);
		companyInfo.setSex(sex);
		companyInfo.setPhone(phone);
		companyInfo.setTelephone(telephone);
		companyInfo.setCompanyInstruction(companyInstruction);
		
		String originalFilename = logopic.getOriginalFilename();
		if(logopic !=null && originalFilename !=null && originalFilename.length()>0) {
			//存储图片的物理路径
			String pic_path = "F:\\pic\\";
			//新的图片名称
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path + newFileName);
			
			//将内存的数据写入磁盘
			logopic.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			companyInfo.setLogo(newFileName);
			
		}
		companyInfoService.addCompanyInfo(companyInfo);
		Company company=new Company();
		company.setCid(ciid);
		company.setState("3");
		companyService.updateState(company);
		return "edit_job";
	}
	/**
	 * 显示企业信息
	 * @param model
	 * @param request
	 * @param companyInfo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyInfoFind",method={RequestMethod.POST,RequestMethod.GET})
	public String companyInfoFind(Model model,HttpServletRequest request,CompanyInfo companyInfo,
				HttpSession session) throws Exception{

		int ciid=(int) session.getAttribute("cid");
		companyInfo=companyInfoService.findCompanyInfo(ciid);
		model.addAttribute("companyInfo", companyInfo);
		model.addAttribute("cid",ciid);
		return "enterprise_edit_info";
	}
	
	@RequestMapping(value="/companyInfoUpdate",method={RequestMethod.POST,RequestMethod.GET})
	public String companyInfoUpadte(Model model,HttpServletRequest request,String companyName,
				String location,String address,String industry,String contacts,String sex,String phone,
				String telephone,String companyInstruction,HttpSession session,MultipartFile logopic) throws Exception{
		System.out.print("aaa");
		int ciid=(int) session.getAttribute("cid");
		CompanyInfo companyInfo=new CompanyInfo();
		companyInfo.setCiid(ciid);
		companyInfo.setCompanyName(companyName);
		companyInfo.setLocation(location);
		companyInfo.setAddress(address);
		companyInfo.setIndustry(industry);
		companyInfo.setContacts(contacts);
		companyInfo.setSex(sex);
		companyInfo.setPhone(phone);
		companyInfo.setTelephone(telephone);
		companyInfo.setCompanyInstruction(companyInstruction);
		
		String originalFilename = logopic.getOriginalFilename();
		if(logopic !=null && originalFilename !=null && originalFilename.length()>0) {
			//存储图片的物理路径
			String pic_path = "F:\\pic\\";
			//新的图片名称
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path + newFileName);
			
			//将内存的数据写入磁盘
			logopic.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			companyInfo.setLogo(newFileName);
			
		}
		companyInfoService.updateCompanyInfo(companyInfo);
		return "enterprise_info_success";
	}
	
	
}
