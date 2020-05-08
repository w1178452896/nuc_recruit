package com.controller;

import com.po.*;
import com.services.AdminService;
import com.services.CommonService;
import com.services.PositionResumeManagementService;
import com.services.ResumeService;
import net.sf.json.util.JSONStringer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

@Controller
public class AdminConterller {
	@Autowired
	ResumeService resumeService;
	@Autowired
	AdminService adminService;

	/**
	 * 用户信息列表
	 */
	@RequestMapping("/findResume11")
	public String findResume(Model model,String keys,ResumeCondition resumeCondition,@RequestParam(value="page",defaultValue="1") Integer page) throws Exception{
		String [] arra;
		List<StudentInfo> resuemList = new ArrayList<StudentInfo>();
		arra = keys.split(" ");
		resumeCondition.setKey(arra);
		int totalRows = resumeService.findResumeCount(resumeCondition);
		System.out.println("totalRows:"+totalRows);
		if(totalRows>0){
			resumeCondition.setTotalRows(totalRows);

			resumeCondition.setCurrentPage(page);
			resuemList = resumeService.findStudentInfo(resumeCondition);
		}
		model.addAttribute("list", resuemList);
		model.addAttribute("page", resumeCondition);
		model.addAttribute("keys",keys);
		return "/search_resume_result_codition";
	}

	@RequestMapping("/insertAdmin")
	public String insertAdmin(Model model,Admin admin) throws Exception{
		admin.setCreateDate(new Date());
		adminService.insert(admin);
		return "/search_resume_result_codition";
	}

	/**
	 * 学生信息导入下载模板
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/template")
	public void exportTemplateExcel(HttpServletResponse response) throws IOException {

		File file = resumeService.exportExcelTemplate();
		try (FileInputStream fis = new FileInputStream(file);
			 OutputStream os = response.getOutputStream()) {
			response.setHeader("Content-disposition", "attachment;filename=" + file.getName());
			response.setContentType("application/vnd.ms-excel");
			int len = 0;
			byte[] bytes = new byte[1024];
			while ((len = fis.read(bytes)) > 0) {
				os.write(bytes, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 学生信息导入
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/importUser")
	public String batchCreate(@RequestParam(value = "file") MultipartFile request) throws Exception {
		resumeService.importCreate(request);
		return "";
	}

	/**
	 * 学生就业信息导出
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/exportEmployment")
	public void exportExcel(HttpServletResponse response) throws Exception {

		File file = resumeService.exportEmployment();
		try (FileInputStream fis = new FileInputStream(file);
			 OutputStream os = response.getOutputStream()) {
			response.setHeader("Content-disposition", "attachment;filename=" + file.getName());
			response.setContentType("application/vnd.ms-excel");
			int len = 0;
			byte[] bytes = new byte[1024];
			while ((len = fis.read(bytes)) > 0) {
				os.write(bytes, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 用户管理页面
	 */
	@RequestMapping("/userManage")
	public String userManage(){
		return "admin/usermanage";
	}



}
