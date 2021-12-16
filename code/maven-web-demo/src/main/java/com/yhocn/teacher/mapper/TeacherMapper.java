package com.yhocn.teacher.mapper;

import java.util.List;

import com.yhocn.teacher.entity.Teacher;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {

	public Teacher login(Teacher t);
	public List<Teacher> selectAll(@Param("t")Teacher t,@Param("c")String c);
	public Teacher selectById(@Param("t")Teacher t,@Param("c")String c);
	public int add(@Param("t")Teacher t,@Param("c")String c);
	public int update(@Param("t")Teacher t,@Param("c")String c);
	public int delete(@Param("t")Teacher t,@Param("c")String c);
	public List<Teacher> selectByRealName(@Param("t")Teacher t,@Param("c")String c);
	public int alter(@Param("t")Teacher t,@Param("c")String c);
	public List<Teacher> selectArr(@Param("t")Teacher t,@Param("c")String c);
	public List<Teacher> selectArr1(@Param("t")Teacher t,@Param("c")String c);


	List<Teacher> selectAll2();

	List<Teacher> selectAll1(@Param("t")Teacher t,@Param("c")String c,@Param("a")String a,@Param("b")String b,@Param("d")String d);
}
