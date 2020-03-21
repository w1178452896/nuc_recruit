package com.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.po.Resume;
import com.po.ResumeCondition;
import com.services.ResumeService;
@Controller
public class SearchResume {
	@Autowired
	ResumeService resumeService;
	/**
	 * 通过条件查找简历
	 * @param model
	 * @param keys
	 * @param resumeCondition
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findResume")
	public String findResume(Model model,String keys,ResumeCondition resumeCondition,@RequestParam(value="page",defaultValue="1") Integer page) throws Exception{
		String [] arra;
		List<Resume> resuemList = new ArrayList<Resume>();
		arra = keys.split(" ");
		resumeCondition.setKey(arra);
		int totalRows = resumeService.findResumeCount(resumeCondition);
		System.out.println("totalRows:"+totalRows);
		if(totalRows>0){
			resumeCondition.setTotalRows(totalRows);
			resumeCondition.setCurrentPage(page);
			resuemList = resumeService.findResume(resumeCondition);
		}
		model.addAttribute("list", resuemList);
		model.addAttribute("page", resumeCondition);
		model.addAttribute("keys",keys);
		return "/search_resume_result_codition";
	}
	/**
	 * 通过简历ID查询简历
	 * @param model
	 * @param uid0
	 * @param uid1
	 * @param uid2
	 * @param uid3
	 * @param uid4
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findResumeById")
	public String findResumeById(Model model,Integer uid0,Integer uid1 ,
			Integer uid2,Integer uid3,Integer uid4) throws Exception{
		int[] uid = new int[5];
		int count = 0;
		List<Resume> resuemList = new ArrayList<Resume>();
		List<Resume> tmpList;
		if(uid0!=null){
			uid[count++] = uid0;
		}
		if(uid1!=null){
			uid[count++] = uid1;
		}
		if(uid2!=null){
			uid[count++] = uid2;
		}
		if(uid3!=null){
			uid[count++] = uid3;
		}
		if(uid4!=null){
			uid[count++] = uid4;
		}
		for (int i = 0; i < count; i++) {
			tmpList = resumeService.findAllResume(uid[i]);
			if(tmpList.size()>0){
				resuemList.add(tmpList.get(0));
			}
		}
		model.addAttribute("list", resuemList);
		return "/search_resume_result_number";
	}
}
 