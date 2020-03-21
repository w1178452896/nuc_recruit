package test;
import net.sf.json.util.JSONStringer;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {
	static ApplicationContext context;
	
	@Before
	public void init(){
		context=new ClassPathXmlApplicationContext("config/springMVC.xml");
	}
	
	//@Test
	public void testInsert(){
		/*MajorSkillService majorSkillService=
				(MajorSkillService)context.getBean("MajorSkillService");
		MajorSkill majorSkill=new MajorSkill();
		majorSkill.setUid(1);
		majorSkill.setSkill("����");
		majorSkillService.insertMajorSkill(majorSkill);*/
		
/*		EducationExperienceService educationExperienceService=
				(EducationExperienceService)context.getBean("EducationExperienceService");
		EducationExperience educationExperience=new EducationExperience();
		Date d=new Date(2016, 10, 06);
		educationExperience.setUid(1);
		educationExperience.setSchool("��ũ");
		educationExperience.setMajor("���");
		educationExperience.setCollege("���ѧԺ");
		educationExperience.setEducation("����");
		educationExperience.setStatement("hehe");
		educationExperience.setsTime(d);
		educationExperience.seteTime(d);
		educationExperienceService.insertEducationExperience(educationExperience);*/
		
		/*Date d=new Date(2016, 10, 06);
		PraticalExperienceService praticalExperienceService=(PraticalExperienceService)context.getBean("PraticalExperienceService");
		PraticalExperience pe=new PraticalExperience();
		pe.setUid(1);
		pe.setCompany("����");
		pe.seteTime(d);
		pe.setPosition("javaʵϰ");
		pe.setsTime(d);
		praticalExperienceService.insertPraticalExperience(pe);*/
		
		/*Date d=new Date(2016, 10, 06);
		ProjectService projectService=(ProjectService)context.getBean("ProjectService");
		Project project=new Project();
		project.setUid(1);
		project.setsTime(d);
		project.seteTime(d);
		project.setPosition("��˿���");
		project.setStatement("hehe");
		project.setProject("�ʼ�ϵͳ");
		projectService.insertProject(project);*/
		
/*		ResumeService resumeService=(ResumeService)context.getBean("ResumeService");
		Resume resume=new Resume();
		resume.setUid(1);
		resume.setBirthday(new Date());
		resume.setCity("GZ");
		resume.setEducation("1");
		resume.setExceptedCity("GZ");
		resume.setExceptedSalary(100);
		resume.setIdCard("123");
		resume.setIntroduction("hehe");
		resume.setMail("123");
		resume.setName("john");
		resume.setNativePlace("GZ");
		resume.setPersonPic("123");
		resume.setPhone("123");
		resume.setPositionApplied("���");
		resume.setPostscript("123");
		resume.setSex("��");
		resume.setWorkYear("3");
		resumeService.insertResume(resume);*/
		
	}
	
	//@Test
	public void testFind(){
/*		UserService userService=(UserService)context.getBean("UserService");
		User user=userService.findUserById(1);
		System.out.println(user.getPassword());*/
		/*MajorSkillService majorSkillService=
				(MajorSkillService)context.getBean("MajorSkillService");
		List<MajorSkill> majorSkillList=majorSkillService.findAllMajorSkill(1);
		System.out.println(majorSkillList.get(0).getMid());
		System.out.println(majorSkillList.get(0).getSkill());*/
		
		/*EducationExperienceService educationExperienceService=
				(EducationExperienceService)context.getBean("EducationExperienceService");
		List<EducationExperience> educationExperienceList=educationExperienceService.findAllEducationExperience(1);
		System.out.println(educationExperienceList.get(0).getSchool());*/

		/*PraticalExperienceService praticalExperienceService=
				(PraticalExperienceService)context.getBean("PraticalExperienceService");
		List<PraticalExperience> praticalExperienceList=praticalExperienceService.findAllPraticalExperience(1);
		System.out.println(praticalExperienceList.get(0).getCompany());*/
		
		/*ProjectService projectService=
				(ProjectService)context.getBean("ProjectService");
		List<Project> projectList=projectService.findAllProject(1);
		System.out.println(projectList.get(0).getPosition());*/
		
		/*ResumeService resumeService=(ResumeService)context.getBean("ResumeService");
		
		Resume resume=new Resume();
		resume=resumeList.get(0);
		System.out.println(resume.getCity());*/
		
		/*UserService userService=(UserService)context.getBean("UserService");
		User user=userService.findUserByUserName("a2013");
		System.out.println(user.getMajorSkill().size());*/
	}
	
	@Test
	public void testUpdate(){
		/*MajorSkillService majorSkillService=
				(MajorSkillService)context.getBean("MajorSkillService");
		MajorSkill majorSkill = new MajorSkill();
		majorSkill.setMid(2);
		majorSkill.setSkill("����");
		majorSkillService.updateMajorSkill(majorSkill);*/
		
		/*EducationExperienceService educationExperienceService=
				(EducationExperienceService)context.getBean("EducationExperienceService");
		EducationExperience ee=new EducationExperience();
		Date d=new Date(2016, 10, 06);
		List<EducationExperience> educationExperienceList=educationExperienceService.findAllEducationExperience(1);
		ee=educationExperienceList.get(0);
		ee.setSchool("����");
		ee.seteTime(d);
		ee.setsTime(d);
		educationExperienceService.updateEducationExperience(ee);*/
		
		/*Date d=new Date(2016, 10, 06);*/
		/*PraticalExperienceService praticalExperienceService=
				(PraticalExperienceService)context.getBean("PraticalExperienceService");
		PraticalExperience pe=new PraticalExperience();
		List<PraticalExperience> praticalExperienceList=praticalExperienceService.findAllPraticalExperience(1);
		pe=praticalExperienceList.get(0);
		pe.setCompany("�ٶ�");
		pe.setsTime(d);
		pe.seteTime(d);
		praticalExperienceService.updatePraticalExperience(pe);*/
		
		/*ProjectService projectService=
				(ProjectService)context.getBean("ProjectService");
		List<Project> projectList=projectService.findAllProject(1);
		Project project=new Project();
		project=projectList.get(0);
		project.setPosition("ǰ�˿���");
		project.seteTime(d);
		project.setsTime(d);
		projectService.updateProject(project);*/
		
/*		ResumeService resumeService=(ResumeService)context.getBean("ResumeService");
		List<Resume> resumeList=resumeService.findAllResume(1);
		Resume resume=new Resume();
		resume=resumeList.get(0);
		System.out.println(resume.toString());
		resume.setCity("HZ");
		resumeService.updateResume(resume);*/
	}
	
	@Test
	public void testDelete(){
	  /*MajorSkillService majorSkillService=
				(MajorSkillService)context.getBean("MajorSkillService");
		majorSkillService.deleteMajorSkill(2);*/

	  /*EducationExperienceService educationExperienceService=
				(EducationExperienceService)context.getBean("EducationExperienceService");
		educationExperienceService.deleteEducationExperience(1);*/
		
		/*PraticalExperienceService praticalExperienceService=
				(PraticalExperienceService)context.getBean("PraticalExperienceService");
		praticalExperienceService.deletePraticalExperience(1);*/
		
		/*ProjectService projectService=(ProjectService)context.getBean("ProjectService");
		projectService.deleteProject(1);*/
		
		/*ResumeService resumeService=(ResumeService)context.getBean("ResumeService");
		resumeService.deleteResume(1);*/
	}
	
	@Test
	public void testMail(){
	/*	UserService UserService=
				(UserService)context.getBean("UserService");
		User user =new User();
		user.setPassword("123456");
		user.setMail("751551592@qq.com");
		UserService.validate(user);*/
	}
}
