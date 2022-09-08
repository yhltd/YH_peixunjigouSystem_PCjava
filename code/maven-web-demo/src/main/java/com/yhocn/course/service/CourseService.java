package com.yhocn.course.service;

import com.yhocn.course.entity.Course;
import com.yhocn.teacherInfo.entity.TeacherInfo;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/7 16:36
 */
public interface CourseService {
    public List<Course> getAllList(Course course, String c);
    public List<Course> getList(Course course, String c,String teacher,String cou,Integer page);
    public Course getListById(Course course, String c);
    public int add(Course course, String c);
    public int update(Course course, String c);
    public int delete(Course course, String c);
}
