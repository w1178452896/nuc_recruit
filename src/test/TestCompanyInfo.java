package test;
/**
 * 
 * @author 梁铭新
 */
public class TestCompanyInfo {
//	 private SqlSessionFactory sqlSessionFactory;
//	    
//	    //@Before
//	    public void setUp() throws Exception {
//	        InputStream is = Resources.getResourceAsStream("config/sqlMapConfig.xml");
//	        sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
//	    }
//	    
//	    //@Test
//	    public void findCompanyInfoMap() throws Exception{
//	    	 SqlSession sqlSession  = sqlSessionFactory.openSession();
//	    	 SqlSession sqlSession2  = sqlSessionFactory.openSession();
//	         CompanyInfoMapper mapper = sqlSession.getMapper(CompanyInfoMapper.class);
//	         CompanyMapper mapper2=sqlSession2.getMapper(CompanyMapper.class);
//	         Company company=mapper2.findAccount("admin");
//	         int ciid = company.getCid();
//	         CompanyInfo companyInfo=mapper.findCompanyInfo(ciid);
//	         System.out.println(companyInfo.getCiid());
//	         System.out.println(companyInfo.getCompanyName());
//	         System.out.println(companyInfo.getLocation());
//	         System.out.println(companyInfo.getAddress());
//	         System.out.println(companyInfo.getIndustry());
//	         System.out.println(companyInfo.getContacts());
//	         System.out.println(companyInfo.getSex());
//	         System.out.println(companyInfo.getPhone());
//	         System.out.println(companyInfo.getTelephone());
//	         System.out.println(companyInfo.getCompanyInstruction());
//	         System.out.println(companyInfo.getLogo());	    
//	         }
//	    
//	    //@Test
//	    public void addCompanyInfoMap() throws Exception{
//	    	 SqlSession sqlSession  = sqlSessionFactory.openSession();
//	    	 SqlSession sqlSession2  = sqlSessionFactory.openSession();
//	         CompanyInfoMapper mapper = sqlSession.getMapper(CompanyInfoMapper.class);
//	         CompanyMapper mapper2=sqlSession2.getMapper(CompanyMapper.class);
//	         Company company=mapper2.findAccount("admin2");
//	         int ciid = company.getCid();
//	         CompanyInfo companyInfo=new CompanyInfo();
//	         companyInfo.setCiid(ciid);	         
//	         companyInfo.setCompanyName("技霸网");
//	         companyInfo.setLocation("广东");
//	         companyInfo.setAddress("华山15栋111");
//	         companyInfo.setIndustry("1");
//	         companyInfo.setContacts("黎嘉伟");
//	         companyInfo.setSex("1");
//	         companyInfo.setPhone("12344567888");
//	         companyInfo.setTelephone("020-88888888");
//	         companyInfo.setCompanyInstruction("你猜");
//	         companyInfo.setLogo("我既帅又萌");	
//	         mapper.addCompanyInfo(companyInfo);
//	         sqlSession.commit();
//	         sqlSession.close();
//	         }
//	    
//	    //@Test
//	    public void updateCompanyInfoMap() throws Exception{
//	    	SqlSession sqlSession=sqlSessionFactory.openSession();
//	    	SqlSession sqlSession2=sqlSessionFactory.openSession();
//	    	CompanyInfoMapper mapper=sqlSession.getMapper(CompanyInfoMapper.class);
//	    	CompanyMapper mapper2=sqlSession2.getMapper(CompanyMapper.class);
//	         Company company=mapper2.findAccount("admin2");
//	         int ciid = company.getCid();
//	         CompanyInfo companyInfo=new CompanyInfo();
//	         companyInfo.setCiid(ciid);	         
//	         companyInfo.setCompanyName("hh网");
//	         companyInfo.setLocation("广东");
//	         companyInfo.setAddress("华山15栋101");
//	         companyInfo.setIndustry("2");
//	         companyInfo.setContacts("黎1嘉伟");
//	         companyInfo.setSex("2");
//	         companyInfo.setPhone("02344567888");
//	         companyInfo.setTelephone("021-88888888");
//	         companyInfo.setCompanyInstruction("你1猜");
//	         companyInfo.setLogo("我既帅1又萌");	
//	         mapper.updateCompanyInfo(companyInfo);
//	         sqlSession.commit();
//	         sqlSession.close();
//	    }
	    	    
}
