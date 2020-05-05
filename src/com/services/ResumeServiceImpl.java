package com.services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.mapper.UserMapper;
import com.po.*;
import com.tools.ExcelUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ResumeMapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service("ResumeService")
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	PositionResumeManagementService positionResumeManagementService;

	@Override
	public List<Resume> findAllResume(int uid) {
		return resumeMapper.findAllResume(uid);
	}

	@Override
	public void deleteResume(int rid) {
		resumeMapper.deleteResume(rid);
	}

	@Override
	public void updateResume(Resume resume) {
		resumeMapper.updateResume(resume);
	}

	@Override
	public void insertResume(Resume resume) {
		resumeMapper.insertResume(resume);
	}

	@Override
	public List<Resume> findResume(ResumeCondition resumeCondition)
			throws Exception {

		return resumeMapper.findResume(resumeCondition);
	}

	@Override
	public List<StudentInfo> findStudentInfo(ResumeCondition resumeCondition) {

		return resumeMapper.findStudentInfo(resumeCondition);
	}

	@Override
	public int findResumeCount(ResumeCondition resumeCondition)
			throws Exception {
		return resumeMapper.findResumeCount(resumeCondition);
	}

	@Override
	public File exportExcelTemplate() throws IOException {
		Map<String, String[]> templateHead = new LinkedHashMap<>();
		templateHead.put("学号", null);
		templateHead.put("邮箱", null);
		templateHead.put("密码", null);
		return ExcelUtil.exportTemplateExcelEx(templateHead);
	}

	@Override
	public void importCreate(CommonsMultipartFile file) throws IOException {
		String outFileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		List<User> userList;
		try {

			InputStream inputStream = file.getInputStream();
			IOUtils.copy(inputStream, new FileOutputStream(outFileName));
			Map<String, String> readMapHead = new LinkedHashMap<>();
			readMapHead.put("学号", "sno");
			readMapHead.put("邮箱", "mail");
			readMapHead.put("密码", "password");
			userList = ExcelUtil.readExcel(outFileName, readMapHead, User.class);
			for (User user : userList) {
				user.setRegisterTime(new Date());
				userMapper.insertUser(user);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public File exportEmployment() throws Exception {
		List<UserResume> userResume = positionResumeManagementService.findUserResume();
		LinkedHashMap<String, String> headMap = new LinkedHashMap<>();
		headMap.put("sno", "学号");
		headMap.put("name", "姓名");
		headMap.put("sex", "性别");
		headMap.put("companyname", "公司");
		headMap.put("position", "职位");

		File os = null;
		try {
			os = ExcelUtil.exportExcel(headMap, userResume);
		} catch (IOException e) {
		     e.printStackTrace();
		}
		return os;
	}
}
