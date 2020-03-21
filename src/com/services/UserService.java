package com.services;

import java.util.List;

import com.po.User;
import com.tools.ServiceException;

/**
 * 
 * @author hp
 *
 */
public interface UserService {
	/**
	 * 通过mail查找user
	 * @param mail
	 * @return
	 */
	public User findUserByMail(String mail) throws Exception;
	
	/**
	 * 通过id查找user
	 * @param uid
	 * @return
	 */
	public User findUserById(int uid) throws Exception;
	
	/**
	 * 查找全部user
	 * @return List
	 */
	public List<User> findAllUser() throws Exception;
	
	/**
	 * 通过id删除user
	 * @param uid
	 */
	public void deleteUser(int uid) throws Exception;
	
	/**
	 * 更新user
	 * @param user
	 */
	public void updateUser(User user) throws Exception;
	
	/**
	 * 添加user
	 * @param user
	 */
	public void insertUser(User user) throws Exception;
	
	/**
	 * 发送验证
	 * @param user
	 */
	public void validate(User user,String type) throws Exception;
	
	/**
	 * 验证激活
	 * @param mail
	 * @param code
	 * @throws ServiceException
	 */
	public void activate(String mail,String code) throws ServiceException;
}
