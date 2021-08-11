package com.yhocn.teacher.mapper;

import java.util.List;

import com.yhocn.teacher.entity.Teacher;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {

	public Teacher login(Teacher t);
	public List<Teacher> selectAll(Teacher t,@Param("c")String c);
	public List<Teacher> selectAll1();
	public Teacher selectById(Teacher t,@Param("c")String c);
	public int add(Teacher t,@Param("c")String c);
	public int update(Teacher t,@Param("c")String c);
	public int delete(Teacher t,@Param("c")String c);
	public List<Teacher> selectByRealName(Teacher t,@Param("c")String c);
	public int alter(Teacher t,@Param("c")String c);
	public List<Teacher> selectArr(Teacher t,@Param("c")String c);
	public List<Teacher> selectArr1(Teacher t,@Param("c")String c);



}
