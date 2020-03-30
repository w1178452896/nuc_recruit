package com.controller;
import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.po.EducationExperience;
import com.po.MajorSkill;
import com.po.PracticalExperience;
import com.po.Project;
import com.po.Resume;
import com.po.User;
import com.services.EducationExperienceService;
import com.services.MajorSkillService;
import com.services.PracticalExperienceService;
import com.services.ProjectService;
import com.services.ResumeService;
import com.services.UserService;

import static org.apache.logging.log4j.ThreadContext.isEmpty;

/**
 * 个人模块Controller
 * @author superJJ
 *
 */
@Controller
@RequestMapping("/user")
public class UserController{
	@Autowired
	MajorSkillService majorSkillSerivce;
	@Autowired
	EducationExperienceService educationExperienceService;
	@Autowired
	PracticalExperienceService practicalExperienceService;
	@Autowired
	ProjectService projectService;
	@Autowired
	ResumeService resumeService;
	@Autowired
	UserService userService;
	/**
	 * 填写个人信息
	 * @param model
	 * @param resume
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateMyResume",method={RequestMethod.POST,RequestMethod.GET})
	public String updateMyResume(HttpServletRequest request, HttpSession session,Resume resume,String bir,
			EducationExperience educationExperience,String eestime,String eeetime,
			String skill1,String skill2,String skill3,PracticalExperience practicalExperience,
			String pestime,String peetime,String proName1,String proName2,
			String posi1,String posi2,String stime1,String stime2,
			String etime1,String etime2,String sta1,String sta2,String education2,
			Model model,MultipartFile personPics,String sno) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int uid=(Integer)session.getAttribute("uid");
		User user = userService.findUserById(uid);
		if (StringUtils.isEmpty(user.getSno())){
			user.setSno(sno);
			userService.updateUser(user);
		}
		if(personPics!=null){
			String originalFileName=personPics.getOriginalFilename();
			String picPath=request.getSession().getServletContext().getRealPath("/upload");
			String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
			File upliadDir = new File(picPath);
			if(!upliadDir.exists()){
				upliadDir.mkdir();
			}
			File newFile=new File(picPath+File.separator+newFileName);
			personPics.transferTo(newFile);
			if(newFileName.equals("")||newFileName==null){
				resume.setPersonPic("pic.jpg");
			}else{
				resume.setPersonPic(newFileName);
			}
		}
		Date dbir=sdf.parse(bir);
		resume.setUid(uid);
		resume.setBirthday(dbir);
		List<Resume> allResume = resumeService.findAllResume(uid);
		if(!allResume.isEmpty()){
			resume.setPersonPic(allResume.get(0).getPersonPic());
			resumeService.updateResume(resume);
		}
		else{
			resumeService.insertResume(resume);
		}
		
		
		Date deestime=sdf.parse(eestime);
		Date deeetime=sdf.parse(eeetime);
		educationExperience.setUid(uid);
		educationExperience.setStime(deestime);
		educationExperience.setEtime(deeetime);
		educationExperience.setEducation(education2);
		if(!educationExperienceService.findAllEducationExperience(uid).isEmpty()){
			System.out.println(educationExperienceService.findAllEducationExperience(uid)+"****************************");
			educationExperience.setEid(educationExperienceService.findAllEducationExperience(uid).get(0).getEid());
			educationExperienceService.updateEducationExperience(educationExperience);
		}else{
			educationExperienceService.insertEducationExperience(educationExperience);
		}
		
		if(skill1!=null||!skill1.equals("")){
			MajorSkill major1=new MajorSkill();
			major1.setUid(uid);
			major1.setSkill(skill1);
			if(!majorSkillSerivce.findAllMajorSkill(uid).isEmpty()){
				major1.setMid(majorSkillSerivce.findAllMajorSkill(uid).get(0).getMid());
				majorSkillSerivce.updateMajorSkill(major1);
			}else{
				majorSkillSerivce.insertMajorSkill(major1);
			}
		}
		
		if(skill2!=null||!skill2.equals("")){
			MajorSkill major2=new MajorSkill();
			major2.setUid(uid);
			major2.setSkill(skill2);
			if(majorSkillSerivce.findAllMajorSkill(uid).size()>=2){
				major2.setMid(majorSkillSerivce.findAllMajorSkill(uid).get(1).getMid());
				majorSkillSerivce.updateMajorSkill(major2);
			}else{
				majorSkillSerivce.insertMajorSkill(major2);
			}
		}
		if(skill3!=null||!skill3.equals("")){
			MajorSkill major3=new MajorSkill();
			major3.setUid(uid);
			major3.setSkill(skill3);
			if(majorSkillSerivce.findAllMajorSkill(uid).size()==3){
				major3.setMid(majorSkillSerivce.findAllMajorSkill(uid).get(2).getMid());
				majorSkillSerivce.updateMajorSkill(major3);
			}else{
				majorSkillSerivce.insertMajorSkill(major3);
			}
		}
		
		Date dpestime=sdf.parse(pestime);
		Date dpeetime=sdf.parse(pestime);
		practicalExperience.setUid(uid);
		practicalExperience.setStime(dpestime);
		practicalExperience.setEtime(dpeetime);
		if(!practicalExperienceService.findAllPracticalExperience(uid).isEmpty()){
			practicalExperience.setPeid(practicalExperienceService.findAllPracticalExperience(uid).get(0).getPeid());
			practicalExperienceService.updatePracticalExperience(practicalExperience);
		}else{
			practicalExperienceService.insertPracticalExperience(practicalExperience);
		}
		
		
		Project project1 = new Project();
		if(proName1!=null&&posi1!=null&&stime1!=null&&etime1!=null&&sta1!=null){
			project1.setUid(uid);
			project1.setProject(proName1);
			project1.setPosition(posi1);
			Date dstime1=sdf.parse(stime1);
			project1.setStime(dstime1);
			Date detime1=sdf.parse(etime1);
			project1.setEtime(detime1);
			project1.setStatement(sta1);
			if(!projectService.findAllProject(uid).isEmpty()){
				project1.setPid(projectService.findAllProject(uid).get(0).getPid());
				projectService.updateProject(project1);
			}else{
				projectService.insertProject(project1);
			}
		}
		
		Project project2 = new Project();
		if(proName2!=null&&posi2!=null&&stime2!=null&&etime2!=null&&sta2!=null){
			project2.setUid(uid);
			project2.setProject(proName2);
			project2.setPosition(posi2);
			Date dstime2=sdf.parse(stime2);
			project2.setStime(dstime2);
			Date detime2=sdf.parse(etime2);
			project2.setEtime(detime2);
			project2.setStatement(sta2);
			if(projectService.findAllProject(uid).size()>=2){
				project2.setPid(projectService.findAllProject(uid).get(1).getPid());
				projectService.updateProject(project2);
			}else{
				projectService.insertProject(project2);
			}
		}
		user.setState("3");
		userService.updateUser(user);
		model.addAttribute("sno",user.getSno());
		model.addAttribute("birthday", bir);
		model.addAttribute("eestime", eestime);
		model.addAttribute("eeetime", eeetime);
		model.addAttribute("skill1", skill1);
		model.addAttribute("skill2", skill2);
		model.addAttribute("skill3", skill3);
		model.addAttribute("pestime", pestime);
		model.addAttribute("peetime", peetime);
		model.addAttribute("project1", project1);
		model.addAttribute("project2", project2);
		model.addAttribute("stime1", stime1);
		model.addAttribute("stime2", stime2);
		model.addAttribute("etime1", etime1);
		model.addAttribute("etime2", etime2);
		
		
		return "user_resume";
	}
	
	@RequestMapping(value="/findMyResume",method={RequestMethod.POST,RequestMethod.GET})
	public String findMyResume(HttpServletRequest request,HttpSession session,Model model,Resume resume,Integer id) throws Exception {
		/*int uid=(Integer)session.getAttribute("uid");
		resume.setUid(uid);
		String originalFileName=person_Pic.getOriginalFilename();
		if(person_Pic!=null&&originalFileName!=null&&originalFileName.length()>0){
			String picPath="C:\\Users\\Public\\Pictures\\Sample Pictures\\";
			String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
			File newFile=new File(picPath+newFileName);
			person_Pic.transferTo(newFile);
			resume.setPersonPic(newFileName);
		}
		
		//转换成日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(dateStr);
		resume.setBirthday(date);
		
		resumeService.insertResume(resume);
		
		User user=userService.findUserById(uid);
		user.setState("3");
		userService.updateUser(user);*/
		int uid;
		System.out.println("*********************************");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//int uid=(Integer)session.getAttribute("uid");
		//System.out.println("*********************uid"+uid);
		System.out.println("*********************id"+id);
		if(id==null){
			uid=(Integer)session.getAttribute("uid");
			
		}else{
			uid=id;
		}
		
		
		List<EducationExperience> educationExperienceList=educationExperienceService.findAllEducationExperience(uid);
		List<MajorSkill> majorSkillList=majorSkillSerivce.findAllMajorSkill(uid);
		List<PracticalExperience> practicalExperienceList=practicalExperienceService.findAllPracticalExperience(uid);
		List<Project> projectList=projectService.findAllProject(uid);
		List<Resume> resumeList=resumeService.findAllResume(uid);
		
		System.out.println(resumeList.get(0).getPostscript()+"************");
		Resume re=resumeList.get(0);
		
		String birthday=sdf.format(resumeList.get(0).getBirthday()); 
		String eestime=sdf.format(educationExperienceList.get(0).getStime()); 
		String eeetime=sdf.format(educationExperienceList.get(0).getEtime());

		User user = userService.findUserById(uid);
		model.addAttribute("sno",user.getSno());
		model.addAttribute("resume", resumeList.get(0));
		model.addAttribute("birthday", birthday);
		model.addAttribute("educationExperience", educationExperienceList.get(0));
		model.addAttribute("eestime", eestime);
		model.addAttribute("eeetime", eeetime);
		
		if(majorSkillList.get(0)!=null){
			model.addAttribute("skill1", majorSkillList.get(0).getSkill());
		}
		if(majorSkillList.get(1)!=null){
			model.addAttribute("skill2", majorSkillList.get(1).getSkill());
		}
		if(majorSkillList.get(2)!=null){
			model.addAttribute("skill3", majorSkillList.get(2).getSkill());
		}
		
//		model.addAttribute("resumeList", resumeList.get(0));
		model.addAttribute("practicalExperience", practicalExperienceList.get(0));
		String pestime=sdf.format(practicalExperienceList.get(0).getStime());
		String peetime=sdf.format(practicalExperienceList.get(0).getStime());
		model.addAttribute("pestime", pestime);
		model.addAttribute("peetime", peetime);
		if(projectList.get(0)!=null){
			String stime1=sdf.format(projectList.get(0).getStime());
			String etime1=sdf.format(projectList.get(0).getEtime());
			model.addAttribute("project1", projectList.get(0));
			model.addAttribute("stime1", stime1);
			model.addAttribute("etime1", etime1);
		}
		if(projectList.get(1)!=null){
			String stime2=sdf.format(projectList.get(1).getStime());
			String etime2=sdf.format(projectList.get(1).getEtime());
			model.addAttribute("project2", projectList.get(1));
			model.addAttribute("stime2", stime2);
			model.addAttribute("etime2", etime2);
		}
//		model.addAttribute("majorSkillList", majorSkillList);
		
		if(request.getParameter("type")!=null){
			String wy=null;
			if(re.getWorkYear().equals("1")){
				wy="无";
			}else if(re.getWorkYear().equals("2")){
				wy="1-3月";
			}else if(re.getWorkYear().equals("3")){
				wy="3-6月";
			}else if(re.getWorkYear().equals("4")){
				wy="6-12月";
			}else if(re.getWorkYear().equals("5")){
				wy="1年以上";
			}
			model.addAttribute("wy", wy);
			return "show_resume_detail";
		}else{
			return "user_resume";
		}
	}
	
	/**
	 * 更改密码
	 * @param model
	 * @param oldPassword
	 * @param newPassword1
	 * @param newPassword2
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updatePassword",method={RequestMethod.POST,RequestMethod.GET})
	public String updatePassword(Model model,String oldPassword,String newPassword1,String newPassword2,HttpSession session) throws Exception {
		try{
			int uid=(Integer)session.getAttribute("uid");
			User user=userService.findUserById(uid);
			if(user.getPassword().equals(oldPassword)){
				if(newPassword1.isEmpty()||newPassword2.isEmpty()){
					//旧密码为空
					model.addAttribute("error", "newpassword is empty");
					return "update_psw";
				}
				else if(newPassword1.equals(newPassword2)){
					//更改密码成功
					user.setPassword(newPassword1);
					userService.updateUser(user);
					return "user_update_success";
				}else{
					//密码1和密码2不相同
					model.addAttribute("error", "password1 isnot equal with password2");
					return "update_psw";
				}
			}else{
				//旧密码不正确
				model.addAttribute("error", "password incorrect");
				return "update_psw";
			}
		}catch(Exception e){
			//账号不存在
			model.addAttribute("error", "the username is not existed");
			return "update_psw";
		}
	}
	
}
