package com.yhocn.student.service;

import java.util.List;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.student.entity.Student;
import com.yhocn.student.mapper.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper dao;

    @Override
    public List<Student> selectAll(Student s, String c, String a, String b, String d, String E, String f, Integer page) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.selectAll(s, c, a, b, d, E, f, page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectAll_mssql(s, c, a, b, d, E, f, page);
        } else {
            System.out.println("用户不存在");
        }
        return null;



    }

    @Override
    public List<Student> selectAll1(Student s, String c, String a, String b, String d, String E, String f, Integer page) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.selectAll1(s, c, a, b, d, E, f, page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectAll1_mssql(s, c, a, b, d, E, f, page);
        } else {
            System.out.println("用户不存在");
        }
        return null;



    }


    @Override
    public Student selectById(Student s, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.selectById(s, c);
    }

    @Override
    public int add(Student s, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.add(s, c);
    }

    @Override
    public int update(Student s, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.update(s, c);
    }

    @Override
    public int delete(Student s, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.delete(s, c);
    }

    @Override
    public List<Student> selectByRealName(Student s, String c, String a) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.selectByRealName(s, c, a);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectByRealName_mssql(s, c, a);
        } else {
            System.out.println("用户不存在");
        }
        return null;


    }

    @Override
    public List<Student> selectArr(Student s, String c) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.selectArr(s, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectArr_mssql(s, c);
        } else {
            System.out.println("用户不存在");
        }
        return null;


    }

    @Override
    public List<Student> selectArr1(Student s, String c, String a) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.selectArr1(s, c, a);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectArr1_mssql(s, c, a);
        } else {
            System.out.println("用户不存在");
        }
        return null;


    }

    @Override
    public List<Shezhi> shezhiList(Shezhi shezhi, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.shezhiList(shezhi, c);
    }

    @Override
    public List<Student> getListByName(String RealName, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getListByName(RealName, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getListByName_mssql(RealName, c);
        } else {
            System.out.println("用户不存在");
        }
        return null;



    }


}
