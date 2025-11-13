package com.yhocn.login.service;

import Bean.DynamicDataSourceHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.mapper.TeacherMapper;
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private TeacherMapper dao;
	
	@Override
	public Teacher login(Teacher t) {
		DynamicDataSourceHolder.setDataSource("dataSource1");
		return dao.login(t);
	}

	@Override
	public Teacher login1(Teacher t) {
		DynamicDataSourceHolder.setDataSource("dataSource4");
		return dao.login1(t);
	}

}
