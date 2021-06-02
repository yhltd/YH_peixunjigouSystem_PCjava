package com.yhocn.teacher.mapper;

import java.util.List;

import com.yhocn.teacher.entity.Teacher;

public interface TeacherMapper {

	public Teacher login(Teacher t);
	public List<Teacher> selectAll(Teacher t);
	public Teacher selectById(Teacher t);
	public int add(Teacher t);
	public int update(Teacher t);
	public int delete(Teacher t);
	public List<Teacher> selectByRealName(Teacher t);
	public int alter(Teacher t);
	public List<Teacher> selectArr(Teacher t);
}
