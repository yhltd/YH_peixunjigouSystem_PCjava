package com.yhocn.student.service;

import java.util.List;

import com.yhocn.student.entity.Student;



public interface StudentService {

	public List<Student> selectAll(Student s);
	public Student selectById(Student s);
	public int add(Student s);
	public int update(Student s);
	public int delete(Student s);
	public List<Student> selectByRealName(Student s);
	
	public List<Student> selectArr(Student s);
}
