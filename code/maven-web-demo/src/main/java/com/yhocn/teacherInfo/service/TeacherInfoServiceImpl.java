package com.yhocn.teacherInfo.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import com.yhocn.teacherInfo.mapper.TeacherInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/8/27 11:58
 */
@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {
    @Autowired
    @Qualifier("teacherInfoMapper")
    private TeacherInfoMapper dao;

    @Override
    public List<TeacherInfo> getAllList(TeacherInfo t, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getAllList(t, c);
    }

    @Override
    public List<TeacherInfo> getList(TeacherInfo t, String c, String t_name, Integer page) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getList(t, c, t_name, page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getList_mssql(t, c, t_name, page);
        } else {
            System.out.println("用户不存在");
        }
        return null;

    }

    @Override
    public TeacherInfo getListById(TeacherInfo t, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getListById(t, c);
    }

    @Override
    public int add(TeacherInfo t, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.add(t, c);
    }

    @Override
    public int update(TeacherInfo t, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.update(t, c);
    }

    @Override
    public int delete(TeacherInfo t, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.delete(t, c);
    }
}
