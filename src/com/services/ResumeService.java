package com.services;
import java.io.File;
import java.io.IOException;
import java.util.List;
import com.po.Resume;
import com.po.ResumeCondition;
import com.po.StudentInfo;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public interface ResumeService {
	/**
	 * 查找全部简历
	 * @param uid
	 * @return 简历List
	 * @throws Exception
	 */
	public List<Resume> findAllResume(int uid) throws Exception;
	/**
	 * 删除简历
	 * @param rid
	 * @throws Exception
	 */
	public void deleteResume(int rid) throws Exception;
	/**
	 * 更新简历
	 * @param resume
	 * @throws Exception
	 */
	public void updateResume(Resume resume) throws Exception;
	/**
	 * 新建简历
	 * @param resume
	 * @throws Exception
	 */
	public void insertResume(Resume resume) throws Exception;
	/**
	 * 条件查询简历
	 * @param ResumeCondition
	 * @return List<Resume>
	 * @throws Exception
	 */
	public List<Resume> findResume(ResumeCondition resumeCondition) throws Exception;
	/**
	 * 条件查询简历总数
	 * @param resumeCondition
	 * @return int
	 * @throws Exception
	 */
	public int findResumeCount(ResumeCondition resumeCondition) throws Exception;

	public List<StudentInfo> findStudentInfo(ResumeCondition resumeCondition);

	File exportExcelTemplate() throws IOException;

	void importCreate(CommonsMultipartFile request)throws IOException;

	File exportEmployment() throws Exception;
}
