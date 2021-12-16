package com.yhocn.student.service;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;



public interface StudentService {

	public List<Student> selectAll(Student s, String c);
	public List<Student> selectAll1(Student s, String c,String a,String b,String d,String E,String f);
	public Student selectById(Student s, String c);
	public int add(Student s, String c);
	public int update(Student s, String c);
	public int delete(Student s, String c);
	public List<Student> selectByRealName(Student s, String c, String a);

	public List<Student> selectArr(Student s, String c);
	public List<Student> selectArr1(Student s, String c,String a);
	public List<Shezhi>shezhiList(Shezhi shezhi, String c);



}
