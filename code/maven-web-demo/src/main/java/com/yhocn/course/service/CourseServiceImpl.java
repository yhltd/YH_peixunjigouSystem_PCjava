package com.yhocn.course.service;

import com.yhocn.course.entity.Course;
import com.yhocn.course.mapper.CourseMapper;
import com.yhocn.teacherInfo.mapper.TeacherInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/7 17:00
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper dao;


    @Override
    public List<Course> getAllList(Course course, String c) {
        return dao.getAllList(course,c);
    }

    @Override
    public List<Course> getList(Course course, String c, String teacher, String cou, Integer page) {
        return dao.getList(course,c,teacher,cou,page);
    }

    @Override
    public Course getListById(Course course, String c) {
        return dao.getListById(course, c);
    }

    @Override
    public int add(Course course, String c) {
        return dao.add(course, c);
    }

    @Override
    public int update(Course course, String c) {
        return dao.update(course, c);
    }

    @Override
    public int delete(Course course, String c) {
        return dao.delete(course, c);
    }
}
