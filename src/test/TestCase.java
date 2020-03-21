package test;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.po.PersonalResume;
import com.po.Position;
import com.po.PositionResumeManagement;
import com.po.QqUser;
import com.po.ShowPositionResume;
import com.services.PositionResumeManagementService;
import com.services.QqUserService;
public class TestCase {
static ApplicationContext context;
    /**
     * 单体测试
     */
    QqUserService qqUserService;
    PositionResumeManagementService positionResumeManagementService;
	@Before
	public void init(){
		context=new ClassPathXmlApplicationContext("config/springMVC.xml");
		positionResumeManagementService=
				(PositionResumeManagementService)context.getBean("positionResumeManagementService");
		qqUserService = (QqUserService) context.getBean("qqUserService");
	}
	
	//@Test
	public void test001(){
		PositionResumeManagement positionResumeManagement = new PositionResumeManagement();
		positionResumeManagement.setPosition(new Position());
		positionResumeManagement.getPosition().setCid(1);
		positionResumeManagement.getPosition().setDepartment("测试");
		try {
			positionResumeManagementService.findPositionByCid(positionResumeManagement);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test002(){
		PositionResumeManagement positionResumeManagement = new PositionResumeManagement();
		positionResumeManagement.setPosition(new Position());
		positionResumeManagement.getPosition().setCid(1);
		positionResumeManagement.getPosition().setDepartment("测试");
		try {
			positionResumeManagementService.findPositionByCidCount(positionResumeManagement);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test003(){
		ShowPositionResume spr = new ShowPositionResume();
	    spr.setPid(1);
	    spr.setState("1");
	    spr.setPageSize(4);
		try {
			positionResumeManagementService.findPositionResumeCount(spr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void test004(){
		int totalRows=0;
		int currentPage=1;
		ShowPositionResume spr = new ShowPositionResume();
	    spr.setPid(1);
	    spr.setState("1");
	    spr.setPageSize(4);
		try {
			positionResumeManagementService.findPositionResumeCount(spr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		spr.setTotalRows(totalRows);
		if(totalRows>0){
			spr.setCurrentPage(currentPage);
			try {
				spr = positionResumeManagementService.findPositionResume(spr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//@Test
	public void test005() throws Exception{
		List<Integer> idArr = new ArrayList<Integer>();
		idArr.add(1);
		idArr.add(2);
		PersonalResume personalResume = new PersonalResume();
		personalResume.setIdArr(idArr);
	    positionResumeManagementService.findPersonalResume(personalResume.getIdArr());	
	}
	
	//@Test
	public void test006() throws Exception{
		List<Integer> idArr = new ArrayList<Integer>();
		idArr.add(1);
		idArr.add(2);
		PersonalResume personalResume = new PersonalResume();
		personalResume.setIdArr(idArr);
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
	
	//@Test
	public void test007() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setOpenId("dfdfsdf");
		qqUser.setType("1");
		qqUserService.findQq(qqUser);
	}
	
	//@Test
    public void test008() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setOpenId("dfdfsdf");
		qqUser.setType("1");
		qqUserService.findQqUser(qqUser);
	}
	
	//@Test
    public void test009() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setOpenId("dfdfsdf");
		qqUser.setType("1");
		qqUserService.findQqCompany(qqUser);
	}
    
    //@Test
    public void test010() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setMail("601647957@qq.com");
		qqUser.setPassword("11023564");
		qqUser.setType("1");
		System.out.println(qqUserService.findUser(qqUser));
	}
    
    //@Test
    public void test011() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setMail("601647957@qq.com");
		qqUser.setPassword("1108784564");
		qqUser.setType("1");
		System.out.println(qqUserService.findCompany(qqUser));
	}
    
    @Test
    public void test012() throws Exception{
		QqUser qqUser = new QqUser();
		qqUser.setOpenId("sdklfjkeio5f4sdfsd");;
		qqUser.setId(2);;
		qqUser.setType("1");
		System.out.println(qqUserService.inserQqUser(qqUser));
	}

	
	
}
