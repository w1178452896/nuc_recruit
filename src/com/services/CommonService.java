package com.services;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.po.PersonalResume;
public interface CommonService {
	/**
	 * 把多个文件打包压缩成一个zip文件
	 * @param List<String> fileName 文件名集合
	 * @throws Exception
	 */
	public void zipFile(List<String> fileName) throws Exception;
	/**
	 * 生成word文档简历
	 * @param PersonalResumeList
	 * @throws Exception
	 */
	public void ExportResume(List<PersonalResume> list)throws Exception;
	/**
	 * 下载文件
	 * @param fileName
	 * @throws Exception
	 */
	public void DownloadFile(String fileName,HttpServletResponse response) throws Exception;
	/**
	 * 发送附件邮件
	 * @param to发送给谁
	 * @param filePath附件文件路径
	 * @param subject邮件标题
	 * @param message邮件主体消息
	 * @return boolean成功返回true，失败返回false
	 * @throws Exception
	 */
	public boolean SendFileEmail(String to,String filePath,String subject,String message)throws Exception;
	/**
	 * 发送邮件
	 * @param to 
	 * @param subject 主题
	 * @param message 信息
	 * @return boolean
	 * @throws Exception
	 */
	public boolean SendEmail(String to,String subject,String message)throws Exception;
}
