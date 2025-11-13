package com.yhocn.student.mapper;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface StudentMapper {

    public List<Student> selectAll(@Param("s") Student s, @Param("c") String c, @Param("a") String a, @Param("b") String b, @Param("d") String d, @Param("E") String E, @Param("f") String f, @Param("page") Integer page);
    public List<Student> selectAll_mssql(@Param("s") Student s, @Param("c") String c, @Param("a") String a, @Param("b") String b, @Param("d") String d, @Param("E") String E, @Param("f") String f, @Param("page") Integer page);

    public List<Student> selectAll1(@Param("s") Student s, @Param("c") String c, @Param("a") String a, @Param("b") String b, @Param("d") String d, @Param("E") String E, @Param("f") String f, @Param("page") Integer page);
    public List<Student> selectAll1_mssql(@Param("s") Student s, @Param("c") String c, @Param("a") String a, @Param("b") String b, @Param("d") String d, @Param("E") String E, @Param("f") String f, @Param("page") Integer page);

    public Student selectById(@Param("s") Student s, @Param("c") String c);

    public int add(@Param("s") Student s, @Param("c") String c);

    public int update(@Param("s") Student s, @Param("c") String c);

    public int delete(@Param("s") Student s, @Param("c") String c);

    public List<Student> selectByRealName(@Param("s") Student s, @Param("c") String c, @Param("a") String a);
    public List<Student> selectByRealName_mssql(@Param("s") Student s, @Param("c") String c, @Param("a") String a);

    public List<Student> selectArr(@Param("s") Student s, @Param("c") String c);
    public List<Student> selectArr_mssql(@Param("s") Student s, @Param("c") String c);

    public List<Student> selectArr1(@Param("s") Student s, @Param("c") String c, @Param("a") String a);
    public List<Student> selectArr1_mssql(@Param("s") Student s, @Param("c") String c, @Param("a") String a);

    public List<Shezhi> shezhiList(@Param("shezhi") Shezhi shezhi, @Param("c") String c);

    public List<Student> getListByName(@Param("RealName") String RealName, @Param("c") String c);
    public List<Student> getListByName_mssql(@Param("RealName") String RealName, @Param("c") String c);
}
