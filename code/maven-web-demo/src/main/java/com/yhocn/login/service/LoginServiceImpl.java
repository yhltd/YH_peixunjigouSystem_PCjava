package com.yhocn.login.service;

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
		return dao.login(t);
	}

}
