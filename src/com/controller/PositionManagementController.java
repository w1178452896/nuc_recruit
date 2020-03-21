package com.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.po.Position;
import com.services.CompanyService;
import com.services.PositionManagementService;
@Controller
public class PositionManagementController {
	@Autowired
	PositionManagementService positionManagementService;
	@Autowired
	CompanyService companyService;
	/**
	 * 显示对应职位信息
	 * @param model
	 * @param request
	 * @param session
	 * @param salary
	 * @param eduRequest
	 * @param experience
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showPosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String showPosition(Model model, HttpServletRequest request,
			HttpSession session, String salary, String eduRequest,
			String experience, Integer pid) throws Exception {
		Position position = positionManagementService.showPosition(pid);
		String salarynumber = position.getSalary();
		String eduRequestnumber = position.getEduRequest();
		String experiencenumber = position.getExperience();
		if (salarynumber.equals("1"))
			salary = "面谈";
		else if (salarynumber.equals("2"))
			salary = "5k以下";
		else if (salarynumber.equals("3"))
			salary = "5k-10k";
		else if (salarynumber.equals("4"))
			salary = "10k-15k";
		else if (salarynumber.equals("5"))
			salary = "15k-20k";
		else
			salary = "20k以上";

		if (experiencenumber.equals("1"))
			experience = "应届毕业生";
		else if (experiencenumber.equals("2"))
			experience = "3年及以下";
		else if (experiencenumber.equals("3"))
			experience = "3-5年";
		else if (experiencenumber.equals("4"))
			experience = "5-10年";
		else if (experiencenumber.equals("5"))
			experience = "10年以上";
		else
			experience = "不要求";

		if (eduRequestnumber.equals("1"))
			eduRequest = "大专";
		else if (eduRequestnumber.equals("2"))
			eduRequest = "本科";
		else if (eduRequestnumber.equals("3"))
			eduRequest = "硕士";
		else if (eduRequestnumber.equals("4"))
			eduRequest = "博士";
		else
			eduRequest = "不限";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String releaseDate = sdf.format(position.getReleaseDate());
		String deadline = sdf.format(position.getDeadline());
		model.addAttribute("releaseDate", releaseDate);
		model.addAttribute("deadline", deadline);
		model.addAttribute("salary", salary);
		model.addAttribute("eduRequest", eduRequest);
		model.addAttribute("experience", experience);
		model.addAttribute("position", position);
		return "ep_job_detail";
	}
	/**
	 * 发布职位
	 * @param model
	 * @param request
	 * @param session
	 * @param position
	 * @param workplace
	 * @param classification
	 * @param department
	 * @param salary
	 * @param eduRequest
	 * @param experience
	 * @param statement
	 * @param email
	 * @param deadline
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "addPosition", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addPosition(Model model, HttpServletRequest request,
			HttpSession session, String position, String workplace,
			String classification, String department, String salary,
			String eduRequest, String experience, String statement,
			String email, String deadline) throws Exception {
		int cid = (int) session.getAttribute("cid");

		Position position1 = new Position();
		Date releaseDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(deadline);
		position1.setCid(cid);
		position1.setPosition(position);
		position1.setWorkplace(workplace);
		position1.setClassification(classification);
		position1.setDepartment(department);
		position1.setSalary(salary);
		position1.setEduRequest(eduRequest);
		position1.setExperience(experience);
		position1.setStatement(statement);
		position1.setEmail(email);
		position1.setBrowsingNumber(0);
		position1.setReleaseDate(releaseDate);
		position1.setDeadline(date);
		position1.setState("1");
		// System.out.println(position1.getClassification());
		// System.out.println(position1.getExperience());
		// System.out.println(position1.getBrowsingNumber());
		positionManagementService.addPosition(position1);
		return "edit_job";
	}

	@RequestMapping(value = "findPosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String findPosition(Model model,  Integer currentPage,
			HttpSession session) throws Exception {
		int cid = (int) session.getAttribute("cid");
		Position position = new Position();
		position.setCid(cid);
		List<Position> list = null;

		position.setPositionList(position);
		int totalRows = positionManagementService.countByCid(cid);
		position.setTotalRows(totalRows);
		if (totalRows > 0) {
			position.setCurrentPage(currentPage);
			list = positionManagementService.findPosition(position);
		}
		model.addAttribute("page", position);
		model.addAttribute("positionList", list);
		return "job_manage_all";
	}

	@RequestMapping(value = "findOnPosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String findOnPosition(Model model, Integer currentPage,
			HttpSession session) throws Exception {
		int cid = (int) session.getAttribute("cid");
		Position position = new Position();
		position.setCid(cid);
		List<Position> list = null;

		position.setPositionList(position);
		int totalRows = positionManagementService.countOnByCid(cid);
		position.setTotalRows(totalRows);
		if (totalRows > 0) {
			position.setCurrentPage(currentPage);
			list = positionManagementService.findOnPosition(position);
		}
		model.addAttribute("page", position);
		model.addAttribute("positionList", list);
		return "job_manage_on";
	}

	@RequestMapping(value = "findOverPosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String findOverPosition(Model model, Integer currentPage,
			HttpSession session) throws Exception {
		int cid = (int) session.getAttribute("cid");
		Position position = new Position();
		position.setCid(cid);
		List<Position> list = null;

		position.setPositionList(position);
		int totalRows = positionManagementService.countOverByCid(cid);
		position.setTotalRows(totalRows);
		if (totalRows > 0) {
			position.setCurrentPage(currentPage);
			list = positionManagementService.findOverPosition(position);
		}

		model.addAttribute("page", position);
		model.addAttribute("positionList", list);
		return "job_manage_over";
	}

	@RequestMapping(value = "deletePosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String deletePosition(Model model, HttpSession session,
			Integer[] positionPid, HttpServletRequest request,Integer currentPage) throws Exception {
//		System.out.println(positionPid.length);
		String action = request.getParameter("action");
//		System.out.println(action);
		if ("delP".equals(action)) {
			positionManagementService.deletePosition(positionPid);
			return "redirect:/findPosition.action?currentPage="+currentPage;
		}else if ("delOnP".equals(action)){
			positionManagementService.deletePosition(positionPid);
			return "redirect:/findOnPosition.action?currentPage="+currentPage;
		}else 
			{ positionManagementService.deletePosition(positionPid);
			return "redirect:/findOverPosition.action?currentPage="+currentPage;		
			}
	}

	@RequestMapping(value = "endPosition", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String endPosition(Model model, HttpSession session,
			Integer[] positionPid, HttpServletRequest request,
			Integer currentPage) throws Exception {
		String action = request.getParameter("action");
		System.out.println(positionPid);
		if ("endP".equals(action)) {
			positionManagementService.endPosition(positionPid);
			return "redirect:/findPosition.action?currentPage="+currentPage;
		}else if ("endOnP".equals(action)){
			positionManagementService.endPosition(positionPid);
			return "redirect:/findOnPosition.action?currentPage="+currentPage;
		}else 
			{ positionManagementService.endPosition(positionPid);
			return "redirect:/findOverPosition.action?currentPage="+currentPage;		
			}
	}

}
