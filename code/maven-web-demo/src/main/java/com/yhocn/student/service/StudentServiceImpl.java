package com.yhocn.student.service;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.student.entity.Student;
import com.yhocn.student.mapper.StudentMapper;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper dao;

	@Override
	public List<Student> selectAll(Student s, String c) {
		return dao.selectAll(s,c);
	}

	@Override
	public List<Student> selectAll1(Student s, String c,String a,String b,String d,String E,String f) {
		return dao.selectAll1(s,c,a,b,d,E,f);
	}


	@Override
	public Student selectById(Student s, String c) {
		return dao.selectById(s,c);
	}

	@Override
	public int add(Student s, String c) {
		return dao.add(s,c);
	}

	@Override
	public int update(Student s, String c) {
		return dao.update(s,c);
	}

	@Override
	public int delete(Student s, String c) {
		return dao.delete(s,c);
	}

	@Override
	public List<Student> selectByRealName(Student s, String c,String a) {
		return dao.selectByRealName(s,c,a);
	}

	@Override
	public List<Student> selectArr(Student s, String c) {
		return dao.selectArr(s,c);
	}
	@Override
	public List<Student> selectArr1(Student s, String c,String a) {
		return dao.selectArr1(s,c,a);
	}

	@Override
	public List<Shezhi> shezhiList(Shezhi shezhi, String c) {
		return dao.shezhiList(shezhi,c);
	}


}
