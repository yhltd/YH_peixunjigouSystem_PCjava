package com.yhocn.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.student.entity.Student;
import com.yhocn.student.mapper.StudentMapper;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper dao;
	
	@Override
	public List<Student> selectAll(Student s) {
		return dao.selectAll(s);
	}

	@Override
	public Student selectById(Student s) {
		return dao.selectById(s);
	}

	@Override
	public int add(Student s) {
		return dao.add(s);
	}

	@Override
	public int update(Student s) {
		return dao.update(s);
	}

	@Override
	public int delete(Student s) {
		return dao.delete(s);
	}

	@Override
	public List<Student> selectByRealName(Student s) {
		return dao.selectByRealName(s);
	}

	@Override
	public List<Student> selectArr(Student s) {
		return dao.selectArr(s);
	}


}
