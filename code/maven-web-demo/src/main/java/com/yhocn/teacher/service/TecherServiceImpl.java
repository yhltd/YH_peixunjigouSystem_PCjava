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
	public List<Teacher> selectAll(Teacher t, String c) {
		return dao.selectAll(t,c);
	}

	@Override
	public List<Teacher> selectAll1() {
		return dao.selectAll1();
	}

	@Override
	public Teacher selectById(Teacher t, String c) {
		return dao.selectById(t,c);
	}

	@Override
	public int add(Teacher t, String c) {
		return dao.add(t,c);
	}

	@Override
	public int update(Teacher t, String c) {
		return dao.update(t,c);
	}

	@Override
	public int delete(Teacher t, String c) {
		return dao.delete(t,c);
	}

	@Override
	public List<Teacher> selectByRealName(Teacher t, String c) {
		return dao.selectByRealName(t,c);
	}

	@Override
	public int alter(Teacher t, String c) {
		return dao.alter(t,c);
	}

	

}
