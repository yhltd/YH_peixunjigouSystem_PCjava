package com.yhocn.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.mapper.TeacherMapper;
@Service
public class TecherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper dao;
	@Override
	public List<Teacher> selectAll(Teacher t) {
		return dao.selectAll(t);
	}

	@Override
	public Teacher selectById(Teacher t) {
		return dao.selectById(t);
	}

	@Override
	public int add(Teacher t) {
		return dao.add(t);
	}

	@Override
	public int update(Teacher t) {
		return dao.update(t);
	}

	@Override
	public int delete(Teacher t) {
		return dao.delete(t);
	}

	@Override
	public List<Teacher> selectByRealName(Teacher t) {
		return dao.selectByRealName(t);
	}

	@Override
	public int alter(Teacher t) {
		return dao.alter(t);
	}

	

}
