package com.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.QqUserMapper;
import com.po.QqUser;
@Service("qqUserService")
public class QqUserImpl implements QqUserService{
	@Autowired
	QqUserMapper qqUserMapper;
	@Override
	public QqUser findQqUser(QqUser qqUser) throws Exception {
		return qqUserMapper.findQqUser(qqUser);
	}
	@Override
	public QqUser findUser(QqUser qqUser) throws Exception {
		return qqUserMapper.findUser(qqUser);
	}
	@Override
	public int inserQqUser(QqUser qqUser) throws Exception {
		return qqUserMapper.inserQqUser(qqUser);
	}
	@Override
	public QqUser findQqCompany(QqUser qqUser) throws Exception {
		return qqUserMapper.findQqCompany(qqUser);
	}
	@Override
	public QqUser findCompany(QqUser qqUser) throws Exception {
		return qqUserMapper.findCompany(qqUser);
	}
	@Override
	public QqUser findQq(QqUser qqUser) throws Exception {
		return qqUserMapper.findQq(qqUser);
	}

}
