package com.mapper;

import java.util.List;

import com.po.Position;

/**
 * 
 * @author MXin
 *
 */
public interface PositionManagementMapper {
	/**
	 * 添加职位
	 * @param position
	 * @throws Exception
	 */
	public void addPosition(Position position) throws Exception;
	
	/**
	 * 根据公司编号cid查询所有职位
	 * @return 
	 * @throws Exception
	 */
	public List<Position> findPosition(Position position)throws Exception;
	
	/**
	 * 根据职位编号pid显示该职位的信息
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	public Position showPosition(int pid) throws Exception;
	
	/**
	 * 根据传入职位编号pid删除该职位
	 * @param pid
	 * @throws Exception
	 */
	public void deletePosition(Integer[] positionPid) throws Exception;
	
	/**
	 * 根据公司编号cid查询招聘中职位
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	public List<Position> findOnPosition(Position position)throws Exception;
	
	/**
	 * 根据公司编号cid查询招聘结束职位
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	public List<Position> findOverPosition(Position position)throws Exception;
	
	/**
	 * 根据公司cid返回公司所有职位数
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	public int countByCid(int cid) throws Exception;
	
	/**
	 * 根据公司cid返回公司招聘中职位数
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	public int countOnByCid(int cid) throws Exception;
	
	/**
	 * 根据公司cid返回公司招聘结束职位数
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	public int countOverByCid(int cid) throws Exception;
	
	/**
	 * 结束招聘
	 * @param positionPid
	 * @throws Exception
	 */
	public void endPosition(Integer[] positionPid) throws Exception;
	
	
}
