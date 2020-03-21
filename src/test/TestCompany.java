package test;
/**
 * 
 * @author 梁铭新
 */
public class TestCompany {
//    private SqlSessionFactory sqlSessionFactory;
//    
//    //@Before
//    public void setUp2() throws Exception {
//        InputStream is = Resources.getResourceAsStream("config/sqlMapConfig.xml");
//        sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
//    }
//    
//	private ApplicationContext context;
//	@Before
//	public void setUp() throws Exception {
//		context =new ClassPathXmlApplicationContext("config/springMVC.xml");
//	}
//    
//    //@Test
//    public void findAccountMap() throws Exception{
//      SqlSession sqlSession  = sqlSessionFactory.openSession();
//      CompanyMapper mapper = sqlSession.getMapper(CompanyMapper.class);
//        Company company = mapper.findAccount("admin");
//        System.out.println(company.getAccount());
//        System.out.println(company.getPassword());       
//        sqlSession.close();
//    }
//    
//    @Test
//    public void findAccountMap2() throws Exception{
//    	CompanyMapper dao=(CompanyMapper)context.getBean("companyMapper");
//    	Company company=dao.findAccount("admin");
//        System.out.println(company.getAccount());
//        System.out.println(company.getPassword());       
//      }
//    
//    //@Test
//    public void registerAccountMap() throws Exception{
//    	SqlSession sqlSession =sqlSessionFactory.openSession();
//    	CompanyMapper mapper=sqlSession.getMapper(CompanyMapper.class);
//    	Company company=new Company();
//    	company.setAccount("admin3");
//    	company.setPassword("admin3");
//    	company.setState("1");
//    	mapper.registerAccount(company);
//    	System.out.println(company);
//    	sqlSession.commit();
//    	sqlSession.close(); 
//    }
//
//    //@Test
//    public void updatePasswordMap() throws Exception{
//    	SqlSession sqlSession =sqlSessionFactory.openSession();
//    	CompanyMapper mapper=sqlSession.getMapper(CompanyMapper.class);
//    	Company company=new Company();
//    	company.setAccount("admin3");
//    	company.setPassword("bbb");
//    	mapper.updatePassword(company);
//    	sqlSession.commit();
//    	sqlSession.close(); 
//    }
}
