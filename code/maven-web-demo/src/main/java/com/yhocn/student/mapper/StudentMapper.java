package com.yhocn.student.mapper;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {

	public List<Student> selectAll(Student s,@Param("c")String c);
	public List<Student> selectAll1(Student s,@Param("c")String c,@Param("a")String a);
	public Student selectById(Student s,@Param("c")String c);
	public int add(Student s,@Param("c")String c);
	public int update(Student s,@Param("c")String c);
	public int delete(Student s,@Param("c")String c);
	public List<Student> selectByRealName(Student s,@Param("c")String c);
	
	public List<Student> selectArr(Student s,@Param("c")String c);
	public List<Student> selectArr1(Student s,@Param("c")String c,@Param("a")String a);
	public List<Shezhi> shezhiList(Shezhi shezhi,@Param("c")String c);
}
