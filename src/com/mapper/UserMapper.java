package com.mapper;

import java.util.List;

import com.po.User;

/**
 * UserMapper
 * @author superJJ
 *
 */
public interface UserMapper {
	/**
	 * 通过mail查找user
	 * @param mail
	 * @return
	 */
	public User findUserByMail(String mail);
	
	/**
	 * 通过id查找user
	 * @param uid
	 * @return
	 */
	public User findUserById(int uid);
	
	/**
	 * 查找全部user
	 * @return user列表
	 */
	public List<User> findAllUser();
	
	/**
	 * 删除user
	 * @param uid
	 */
	public void deleteUser(int uid);
	
	/**
	 * 更新user
	 * @param user
	 */
	public void updateUser(User user);
	
	/**
	 * 添加user
	 * @param user
	 */
	public void insertUser(User user);
}
