package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.po.CompanyInfo;
import com.po.Position;
import com.po.PositionAndCompany;
import com.po.PositionResume;
import com.services.CompanyInfoService;
import com.services.PositionResumeManagementService;
import com.services.PositionService;

@Controller
public class PositionSearchController {
	@Autowired
	PositionService positionService;
	@Autowired
	CompanyInfoService companyInfoService;
	@Autowired
	PositionResumeManagementService positionResumeManagementService;
	/**
	 * 按用户要求搜索职位
	 * @param model
	 * @param request
	 * @param currentPage
	 * @return
	 * @throws UnsupportedEncodingException
	 */
/*	@RequestMapping(value="/findPosition",method={RequestMethod.POST,RequestMethod.GET})
	public String findPosition(Model model,HttpServletRequest request,Integer currentPage) throws UnsupportedEncodingException{
		String workplace=request.getParameter("workplace");
		String experience=request.getParameter("experience");
		String salary=request.getParameter("salary");
		String eduRequest=request.getParameter("eduRequest");
		String classification=request.getParameter("classification");
		String input=new String(request.getParameter("input").getBytes("ISO-8859-1"),"UTF-8" );
		Position position=new Position(input,workplace,classification,salary,eduRequest,experience);
		int count=positionService.findPositionCount(position);
		System.out.println(workplace);
		System.out.println(input);
		System.out.println(count+"******");
		position.setPageSize(5);
		position.setTotalRows(count);
		if(currentPage==null){
			currentPage=1;
		}
		position.setCurrentPage(currentPage);
		List<Position> positionList=positionService.findPosition(position);
		
		
		for(Position p:positionList){
			System.out.println(p.getPid());
		}
		
		return "job_search";
	}*/
	
	/**
	 * user_index最新职位排行
	 * @param model
	 * @param request
	 * @param currentPage
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/positionRank",method={RequestMethod.POST,RequestMethod.GET})
	public String positionRank(Model model,HttpServletRequest request) throws Exception{
		List<Position> positionList=positionService.findAllPosition();
		List<CompanyInfo> companyInfoList=new ArrayList<CompanyInfo>();
		int size=positionList.size();
		Position tmp;
		//对发布日期进行排序
		for(int i=0;i<size;i++){
			for(int j=i;j<size;j++){
				if(positionList.get(i).getReleaseDate().getTime()<positionList.get(j).getReleaseDate().getTime()){
					tmp=positionList.get(i);
					positionList.set(i, positionList.get(j));
					positionList.set(j, tmp);
				}
			}
		}
		int max=0;
		if(positionList.size()<5){
			max=positionList.size();
		}
		for(int i=0;i<max;i++){
			System.out.println(positionList.get(i).getReleaseDate());
		}
		
		companyInfoList.add(companyInfoService.findCompanyInfo(positionList.get(0).getCid()));
		companyInfoList.add(companyInfoService.findCompanyInfo(positionList.get(1).getCid()));
		companyInfoList.add(companyInfoService.findCompanyInfo(positionList.get(2).getCid()));
		companyInfoList.add(companyInfoService.findCompanyInfo(positionList.get(3).getCid()));
		companyInfoList.add(companyInfoService.findCompanyInfo(positionList.get(4).getCid()));
		
		model.addAttribute("company1", companyInfoList.get(0));
		model.addAttribute("company2", companyInfoList.get(1));
		model.addAttribute("company3", companyInfoList.get(2));
		model.addAttribute("company4", companyInfoList.get(3));
		model.addAttribute("company5", companyInfoList.get(4));
		
		for(int i=0;i<5;i++){
			if(positionList.get(i).getSalary().equals("1")){
				positionList.get(i).setSalary("不限");
			}else if(positionList.get(i).getSalary().equals("2")){
				positionList.get(i).setSalary("5K以下");
			}else if(positionList.get(i).getSalary().equals("3")){
				positionList.get(i).setSalary("5K-10K");
			}else if(positionList.get(i).getSalary().equals("4")){
				positionList.get(i).setSalary("10K-15K");
			}else if(positionList.get(i).getSalary().equals("5")){
				positionList.get(i).setSalary("15K-20K");
			}else if(positionList.get(i).getSalary().equals("6")){
				positionList.get(i).setSalary("20K以上");
			}
		}
		
		for(int i=0;i<5;i++){
			if(positionList.get(i).getEduRequest().equals("1")){
				positionList.get(i).setEduRequest("大专");
			}else if(positionList.get(i).getEduRequest().equals("2")){
				positionList.get(i).setEduRequest("本科");
			}else if(positionList.get(i).getEduRequest().equals("3")){
				positionList.get(i).setEduRequest("硕士");
			}else if(positionList.get(i).getEduRequest().equals("4")){
				positionList.get(i).setEduRequest("博士");
			}else{
				positionList.get(i).setEduRequest("不限");
			}
		}
		
		for(int i=0;i<5;i++){
			if(positionList.get(i).getExperience().equals("1")){
				positionList.get(i).setExperience("应届毕业生");
			}else if(positionList.get(i).getExperience().equals("2")){
				positionList.get(i).setExperience("3年以下");
			}else if(positionList.get(i).getExperience().equals("3")){
				positionList.get(i).setExperience("3-5年");
			}else if(positionList.get(i).getExperience().equals("4")){
				positionList.get(i).setExperience("5-10年");
			}else if(positionList.get(i).getExperience().equals("5")){
				positionList.get(i).setExperience("10年以上");
			}else{
				positionList.get(i).setExperience("不要求");
			}
		}
		
		model.addAttribute("position1", positionList.get(0));
		model.addAttribute("position2", positionList.get(1));
		model.addAttribute("position3", positionList.get(2));
		model.addAttribute("position4", positionList.get(3));
		model.addAttribute("position5", positionList.get(4));
		return "user_index";
	}

	
	@RequestMapping(value="/findPositionByCondition",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView findPositionByCondition(HttpServletRequest request,Model model,Position position,String search) throws Exception{
		ModelAndView mav= new ModelAndView();
		//String input = null;
		String input=null;
		//input=new String(request.getParameter("input").getBytes("ISO-8859-1"),"UTF-8" );
		input=request.getParameter("input");
		System.out.println("search"+search);
		System.out.println("p"+position.getPosition());
		if(input==null){
			input=search;
		}
		System.out.println("input"+input);
		if(input!=null&&!input.equals("")){
			position.setPosition(input);
		}
		List<Position> positionList = new ArrayList<Position>(); 
		List<PositionAndCompany> positionAndCompanyList = new ArrayList<PositionAndCompany>(); 
		if(position.getWorkplace()!=null){
			if(position.getWorkplace().equals("全国")){
				position.setWorkplace(null);
			}
		}
		if(position.getSalary()!=null){
			if(position.getSalary().equals("1")){
				position.setSalary(null);
			}
		}
		if(position.getEduRequest()!=null){
			if(position.getEduRequest().equals("6")){
				position.setEduRequest(null);
			}
		}
		if(position.getExperience()!=null){
			if(position.getExperience().equals("6")){
				position.setExperience(null);
			}
		}
		if(search!=null){
			mav.addObject("s1", search);
		}
		else{
			mav.addObject("s1", null);
		}
		
		if(input!=null){
			mav.addObject("s1", input);
		}
		else{
			mav.addObject("s1", null);
		}
		
		if(position.getPosition()!=null){
			mav.addObject("s1", position.getPosition());
		}
		else{
			mav.addObject("s1", null);
		}
		
		if(position.getWorkplace()!=null){
			mav.addObject("s2", position.getWorkplace());
		}
		else{
			mav.addObject("s2", "全国");
		}
		
		if(position.getExperience()!=null){
			mav.addObject("s3", position.getExperience());
		}
		else{
			mav.addObject("s3", "6");
		}
		
		if(position.getEduRequest()!=null){
			mav.addObject("s4", position.getEduRequest());
		}
		else{
			mav.addObject("s4", "6");
		}
		
		if(position.getSalary()!=null){
			mav.addObject("s5", position.getSalary());
		}
		else{
			mav.addObject("s5", "1");
		}
		
		positionList = positionService.findPositionByCondition(position);
		System.out.println("total"+positionList.size());
		Position positionTmp=new Position();
		CompanyInfo companyInfo=new CompanyInfo();
		
		for(int i=0;i<positionList.size();i++){
			PositionAndCompany positionAndCompany =new PositionAndCompany();
			positionTmp=positionList.get(i);
			
			if(positionTmp.getEduRequest().equals("1")){
				positionTmp.setEduRequest("大专");
			}else if(positionTmp.getEduRequest().equals("2")){
				positionTmp.setEduRequest("本科");
			}else if(positionTmp.getEduRequest().equals("3")){
				positionTmp.setEduRequest("硕士");
			}else if(positionTmp.getEduRequest().equals("4")){
				positionTmp.setEduRequest("博士");
			}else {
				positionTmp.setEduRequest("不限");
			}
			
			if(positionTmp.getExperience().equals("1")){
				positionTmp.setExperience("应届毕业生");
			}else if(positionTmp.getExperience().equals("2")){
				positionTmp.setExperience("3年以下");
			}else if(positionTmp.getExperience().equals("3")){
				positionTmp.setExperience("3-5年");
			}else if(positionTmp.getExperience().equals("4")){
				positionTmp.setExperience("5-10年");
			}else if(positionTmp.getExperience().equals("5")){
				positionTmp.setExperience("10年以上");
			}else{
				positionTmp.setExperience("不要求");
			}
			
			if(positionTmp.getSalary().equals("1")){
				positionTmp.setSalary("不限");
			}else if(positionTmp.getSalary().equals("2")){
				positionTmp.setSalary("5K以下");
			}else if(positionTmp.getSalary().equals("3")){
				positionTmp.setSalary("5K-10K");
			}else if(positionTmp.getSalary().equals("4")){
				positionTmp.setSalary("10K-15K");
			}else if(positionTmp.getSalary().equals("5")){
				positionTmp.setSalary("15K-20K");
			}else if(positionTmp.getSalary().equals("6")){
				positionTmp.setSalary("20K以上");
			}
			
			companyInfo=companyInfoService.findCompanyInfo(positionTmp.getCid());
			positionAndCompany.setPosition(positionTmp);
			positionAndCompany.setCompanyName(companyInfo.getCompanyName());
			positionAndCompany.setIndustry(companyInfo.getIndustry());
			positionAndCompanyList.add(positionAndCompany);
		}
		
		
		

		mav.addObject("positionAndCompanyList", positionAndCompanyList);
		
		mav.addObject("input", input);
		mav.setViewName("job_search");
		return mav;
	}
	
	@RequestMapping(value="/findJobDetail",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView findJobDetail(HttpServletRequest request) throws Exception{
		ModelAndView mav= new ModelAndView();
		//String companyName=new String(request.getParameter("companyName").getBytes("ISO-8859-1"),"UTF-8" );
		String companyName = request.getParameter("companyName");
		System.out.println("companyName"+companyName);
		//String positionName=new String(request.getParameter("position").getBytes("ISO-8859-1"),"UTF-8" );
		String positionName = request.getParameter("position");
		System.out.println("position"+positionName);
		CompanyInfo companyInfo=companyInfoService.findCompanyInfoByName(companyName);
		System.out.println("companyName"+companyName);
		Position position=new Position();
		position.setPosition(positionName);
		position.setCid(companyInfo.getCiid());
		Position result=positionService.findPosition(position).get(0);
		if(result.getEduRequest().equals("1")){
			result.setEduRequest("大专");
		}else if(result.getEduRequest().equals("2")){
			result.setEduRequest("本科");
		}else if(result.getEduRequest().equals("3")){
			result.setEduRequest("硕士");
		}else if(result.getEduRequest().equals("4")){
			result.setEduRequest("博士");
		}else {
			result.setEduRequest("不限");
		}
		if(result.getExperience().equals("1")){
			result.setExperience("应届毕业生");
		}else if(result.getExperience().equals("2")){
			result.setExperience("3年以下");
		}else if(result.getExperience().equals("3")){
			result.setExperience("3-5年");
		}else if(result.getExperience().equals("4")){
			result.setExperience("5-10年");
		}else if(result.getExperience().equals("5")){
			result.setExperience("10年以上");
		}else{
			result.setExperience("不要求");
		}
		if(result.getSalary().equals("2")){
			result.setSalary("5k以下");
		}else if(result.getSalary().equals("3")){
			result.setSalary("5k-10k");
		}else if(result.getSalary().equals("4")){
			result.setSalary("10k-15k");
		}else if(result.getSalary().equals("5")){
			result.setSalary("15k-20k");
		}else if(result.getSalary().equals("6")){
			result.setSalary("20k以上");
		}else{
			result.setSalary("面谈");
		}
		mav.addObject("result", result);
		mav.addObject("companyInfo", companyInfo);
		mav.setViewName("job_detail");
		return mav;
	}
	
	@RequestMapping(value="/teste",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String teste( String number){
		
		number = "110";
		return number;
	}
	
	@RequestMapping(value="/sendResume",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView sendResume(HttpSession session,HttpServletRequest request) throws Exception{
		int uid=(Integer) session.getAttribute("uid");
		ModelAndView mav= new ModelAndView();
		String positionName=request.getParameter("position");
		//String positionName=new String(request.getParameter("position").getBytes("ISO-8859-1"),"UTF-8" );
		//String companyName=new String(request.getParameter("company").getBytes("ISO-8859-1"),"UTF-8" );
		String companyName=request.getParameter("company");
		Position position = new Position();
		System.out.println("uid"+uid);
		System.out.println("positionName"+positionName);
		System.out.println("company"+companyName);
		CompanyInfo companyInfo=companyInfoService.findCompanyInfoByName(companyName);
		System.out.println("cid"+companyInfo.getCiid());
		position.setCid(companyInfo.getCiid());
		position.setPosition(positionName);
		Date date=new Date();
		PositionResume positionResume=new PositionResume();
		positionResume.setPid(positionService.findPosition(position).get(0).getPid());
		positionResume.setUid(uid);
		positionResume.setDeliveryDate(date);
		positionResume.setState("w");
		positionResumeManagementService.insertPositionResume(positionResume);
		mav.setViewName("user_index_redirect");
		return mav;
	}
	

}
