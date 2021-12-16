package com.yhocn.teacher.service;

import java.util.List;

import com.yhocn.teacher.entity.Teacher;

public interface TeacherService {

	public List<Teacher> selectAll(Teacher t, String c);
	public List<Teacher> selectAll1(Teacher t, String c, String a, String b, String d);
	public Teacher selectById(Teacher t, String c);
	public int add(Teacher t, String c);
	public int update(Teacher t, String c);
	public int delete(Teacher t, String c);
	public List<Teacher> selectByRealName(Teacher t, String c);
	public int alter(Teacher t, String c);
	public List<Teacher> selectAll2();
}
