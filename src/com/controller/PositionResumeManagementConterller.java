package com.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.po.*;
import net.sf.json.util.JSONStringer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.services.CommonService;
import com.services.PositionResumeManagementService;
@Controller
public class PositionResumeManagementConterller {
	@Autowired
	PositionResumeManagementService positionResumeManagementService;
	@Autowired
	CommonService commonService;
	@RequestMapping(value="/findPositionByCid", method={RequestMethod.POST,RequestMethod.GET})
	public String findPositionByCid(Model model,HttpServletRequest request,Position position,@RequestParam(value="currentPage" ,defaultValue="1") Integer currentPage) throws Exception{
		List<PositionResumeManagement> list =null ;
		PositionResumeManagement prm = new PositionResumeManagement();
		int cid = (Integer) request.getSession().getAttribute("cid");
		position.setCid(cid);
		//position.setDepartment("开发");
		//position.setState("w");
		prm.setPosition(position);
		int totalRows = positionResumeManagementService.findPositionByCidCount(prm);
		prm.setTotalRows(totalRows);
		if(totalRows>0){
			prm.setCurrentPage(currentPage);
			list = positionResumeManagementService.findPositionByCid(prm);
		}
		model.addAttribute("list", list);
		model.addAttribute("page",prm);
		if(position.getState().isEmpty()){
			return "/resume_manage_index_all";
		}else if(position.getState().equals("1")){
			return "/resume_manage_index_on";
		}else{
			return "/resume_manage_index_over";
		}
		
	}
	/**
	 * 根据职位查找简历
	 * @param model
	 * @param currentPage
	 * @param pid
	 * @param state
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="findPositionResume",method={RequestMethod.POST,RequestMethod.GET})
	public String findPositionResume(Model model, @RequestParam(value="currentPage" ,defaultValue="1") Integer currentPage,Integer pid,String state) throws Exception{
		ShowPositionResume spr = new ShowPositionResume();
	    spr.setPid(pid);
	    spr.setState(state);
	    spr.setPageSize(4);
		int totalRows = positionResumeManagementService.findPositionResumeCount(spr);
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			spr = positionResumeManagementService.findPositionResume(spr);
			spr.setTotalRows(totalRows);
			spr.setPageSize(4);
			spr.setCurrentPage(currentPage);
		}
		model.addAttribute("resume", spr);
		if(state.equalsIgnoreCase("w")) return "/resume_manage_deal";
		else if(state.equalsIgnoreCase("s")) return "/resume_manage_send";
		else if(state.equalsIgnoreCase("e")) return "/resume_manage_employ";
		else return "/resume_manage_un";
		
	}
	/**
	 * 导出简历
	 * @param model
	 * @param response
	 * @param personalResume
	 * @throws Exception
	 */
	@RequestMapping("exportResume")
	public void  ExportResume(Model model,HttpServletResponse response,PersonalResume personalResume) throws Exception{
		List<PersonalResume> list = new ArrayList<PersonalResume>();
	    if(personalResume.getIdArr().size()>0){
	    	list = positionResumeManagementService.findPersonalResume(personalResume.getIdArr());
			String rootPath = this.getClass().getResource("/..").getFile().toString();
			System.out.println("rootPath:"+rootPath);
			rootPath = rootPath.substring(1, rootPath.length());
			//生成word文档
			commonService.ExportResume(list);
			//生成需要打包下载的文件名
			List<String> fileName = new ArrayList<String>();
		    for (int i = 0; i < list.size(); i++) {
		    	fileName.add(rootPath+"tmp/"+list.get(i).getName()+".doc");
			}
		    //打包文件
		    commonService.zipFile(fileName);
		    commonService.DownloadFile(rootPath+"tmp/resume.zip", response);     
	    }
     }   
	
	@RequestMapping("sentResumeMail")
	@ResponseBody
	public String sentResumeMail(Model model,HttpServletResponse response,HttpServletRequest request, @RequestBody PersonalResume personalResume
			){
		JSONStringer stringer = new JSONStringer();
		JSONStringer stringer1 = new JSONStringer();
		String returnFalse = stringer.object().key("result").value("FALSE").endObject().toString();
		String returnTrue = stringer1.object().key("result").value("TRUE").endObject().toString();
		List<PersonalResume> list = new ArrayList<PersonalResume>();
		System.out.println(personalResume.getIdArr().get(0));
		System.out.println("to:"+personalResume.getTo());
		System.out.println("subject:"+personalResume.getSubject());
		if(personalResume.getIdArr().size()>0){
			try {
				list = positionResumeManagementService.findPersonalResume(personalResume.getIdArr());
			} catch (Exception e) {
				return returnFalse;
			}
			String rootPath = getClass().getResource("/..").getFile().toString();
			rootPath = rootPath.substring(1, rootPath.length());
			//生成word文档
			try {
				commonService.ExportResume(list);
			} catch (Exception e) {
				return returnFalse;
			}
			//生成需要打包下载的文件名
			List<String> fileName = new ArrayList<String>();
		    for (int i = 0; i < list.size(); i++) {
		    	fileName.add(rootPath+"tmp/"+list.get(i).getName()+".doc");
			}
		    //打包文件
		    try {
				commonService.zipFile(fileName);
			} catch (Exception e) {
				return returnFalse;
			}
		    try {
				commonService.SendFileEmail(personalResume.getTo(),rootPath+"tmp/resume.zip" , personalResume.getSubject(), personalResume.getMessage());
			} catch (Exception e) {
				return returnFalse;
			} 
		    return returnTrue;
		}   
			return returnFalse;
	}   
	/**
	 * 发送邀请邮件
	 * @param model
	 * @param response
	 * @param personalResume
	 * @param pid 职位ID	
	 * @param currentPage 当前页面
	 * @return string 
	 * @throws Exception
	 */
	@RequestMapping("sentInviteEmail")
	public String sentInviteEmail(Model model,HttpServletResponse response,PersonalResume personalResume,Integer pid,Integer currentPage) throws Exception{
		List<PersonalResume> list = new ArrayList<PersonalResume>();
		System.out.println(personalResume.getIdArr().size());
		System.out.println(pid);
		if(personalResume.getIdArr().size()>0){
			list = positionResumeManagementService.findPersonalResume(personalResume.getIdArr());
			for (int i = 0; i < list.size(); i++) {
				commonService.SendEmail("1179452896@qq.com", personalResume.getSubject(), list.get(i).getName()+"你好"+personalResume.getMessage());
			}
			String state = "s";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("uidList", personalResume.getIdArr());
			map.put("state", state);
			try {
				positionResumeManagementService.updatePositionResume(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/findPositionResume.action?pid="+pid+"&state=W&currentPage="+currentPage;
	}
	/**
	 * 标记为不合适
	 * @param model
	 * @param response
	 * @param personalResume
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updatePositionResume")
	public String updatePositionResume(Model model,HttpServletResponse response,PersonalResume personalResume,Integer pid,String state,@RequestParam(value="currentPage" , defaultValue="1")Integer currentPage) throws Exception{
		System.out.println(personalResume.getIdArr().size());
		System.out.println(pid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pid",pid);
		map.put("uidList", personalResume.getIdArr());
		map.put("state", "r");
		try {
			positionResumeManagementService.updatePositionResume(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ShowPositionResume spr = new ShowPositionResume();
	    spr.setPid(pid);
	    spr.setState(state);
	    spr.setPageSize(4);
		int totalRows = positionResumeManagementService.findPositionResumeCount(spr);
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			spr = positionResumeManagementService.findPositionResume(spr);
			spr.setTotalRows(totalRows);
			spr.setPageSize(4);
			spr.setCurrentPage(currentPage);
		}
		model.addAttribute("resume", spr);
		if(state.equalsIgnoreCase("w")) return "/resume_manage_deal";
		else if(state.equalsIgnoreCase("s")) return "/resume_manage_send";
		else if(state.equalsIgnoreCase("e")) return "/resume_manage_employ";
		else return "/resume_manage_un";
	}

	/**
	 * 聘用
	 * @param model
	 * @param response
	 * @param personalResume
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("employ")
	public String employ(Model model,HttpServletResponse response,PersonalResume personalResume,Integer pid,String state,@RequestParam(value="currentPage" , defaultValue="1")Integer currentPage) throws Exception{
		System.out.println(personalResume.getIdArr().size());
		System.out.println(pid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pid",pid);
		map.put("uidList", personalResume.getIdArr());
		map.put("state", "e");
		try {
			positionResumeManagementService.updatePositionResume(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ShowPositionResume spr = new ShowPositionResume();
	    spr.setPid(pid);
	    spr.setState(state);
	    spr.setPageSize(4);
		int totalRows = positionResumeManagementService.findPositionResumeCount(spr);
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			spr = positionResumeManagementService.findPositionResume(spr);
			spr.setTotalRows(totalRows);
			spr.setPageSize(4);
			spr.setCurrentPage(currentPage);
		}
		model.addAttribute("resume", spr);
		if(state.equalsIgnoreCase("w")) return "/resume_manage_deal";
		else if(state.equalsIgnoreCase("s")) return "/resume_manage_send";
		else if(state.equalsIgnoreCase("e")) return "/resume_manage_employ";
		else return "/resume_manage_un";
	}

	@RequestMapping("positionByUid")
	public String uid(Model model,HttpServletResponse response,Integer uid,String state,@RequestParam(value="currentPage" , defaultValue="1")Integer currentPage) throws Exception{

		ShowCompanyResume spr = new ShowCompanyResume();
		spr.setUid(uid);
		spr.setState(state);
		int totalRows = positionResumeManagementService.findCompanyResumeCount(spr);
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			spr = positionResumeManagementService.findCompanyResume(spr);
			spr.setTotalRows(totalRows);
			spr.setCurrentPage(currentPage);
		}
		model.addAttribute("resume", spr);
		if(state.equalsIgnoreCase("w")) return "/resume_manage_deal";
		else if(state.equalsIgnoreCase("s")) return "/resume_manage_send";
		else if(state.equalsIgnoreCase("e")) return "/resume_manage_employ";
		else return "/resume_manage_un";
	}

	/**
	 *当前用户简历投递情况
	 * @param model
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("positionByCurrentUser")
	public String currentUser(Model model, HttpSession session,@RequestParam(value="currentPage" , defaultValue="1")Integer currentPage) throws Exception{

		ShowCompanyResume spr = new ShowCompanyResume();
		spr.setUid((int)session.getAttribute("uid"));
		int totalRows = positionResumeManagementService.findCompanyResumeCount(spr);
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			spr = positionResumeManagementService.findCompanyResume(spr);
			spr.setTotalRows(totalRows);
			spr.setCurrentPage(currentPage);
		}
		model.addAttribute("list", spr.getCompanyResume());
		model.addAttribute("totalPage", spr.getTotalPage());
		model.addAttribute("currentPage", spr.getCurrentPage());
		return "/user_company_detail";
	}

}
