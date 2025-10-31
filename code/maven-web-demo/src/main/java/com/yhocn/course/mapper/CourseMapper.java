package com.yhocn.course.mapper;

import com.yhocn.course.entity.Course;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/7 16:23
 */
@Mapper
public interface CourseMapper {
    public List<Course> getAllList(@Param("course") Course course, @Param("c") String c);

    public List<Course> getList(@Param("course") Course course, @Param("c") String c, @Param("teacher") String teacher, @Param("cou") String cou, @Param("page") Integer page);

    public Course getListById(@Param("course") Course course, @Param("c") String c);

    public int add(@Param("course") Course course, @Param("c") String c);

    public int update(@Param("course") Course course, @Param("c") String c);

    public int delete(@Param("course") Course course, @Param("c") String c);
}
