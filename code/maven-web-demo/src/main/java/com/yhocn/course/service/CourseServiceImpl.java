package com.yhocn.course.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.course.entity.Course;
import com.yhocn.course.mapper.CourseMapper;
import com.yhocn.login.DataSourceSelector;
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

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getAllList(course,c);
    }

    @Override
    public List<Course> getList(Course course, String c, String teacher, String cou, Integer page) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getList(course,c,teacher,cou,page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getList_mssql(course,c,teacher,cou,page);
        } else {
            System.out.println("用户不存在");
        }
        return null;

    }

    @Override
    public Course getListById(Course course, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getListById(course, c);
    }

    @Override
    public int add(Course course, String c) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.add(course, c);
    }

    @Override
    public int update(Course course, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.update(course, c);
    }

    @Override
    public int delete(Course course, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.delete(course, c);
    }
}
