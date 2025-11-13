package com.yhocn.kaoqin.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.course.mapper.CourseMapper;
import com.yhocn.kaoqin.entity.KaoQin;
import com.yhocn.kaoqin.mapper.KaoQinMapper;
import com.yhocn.login.DataSourceSelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/8 9:23
 */
@Service
public class KaoQinServiceImpl implements KaoQinService {
    @Autowired
    private KaoQinMapper dao;


    @Override
    public List<KaoQin> getAllList(KaoQin kaoQin, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getAllList(kaoQin, c);
    }

    @Override
    public List<KaoQin> getList(KaoQin kaoQin, String c, String s_name, Integer page) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getList(kaoQin, c, s_name, page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getList_mssql(kaoQin, c, s_name, page);
        } else {
            System.out.println("用户不存在");
        }
        return null;

    }

    @Override
    public KaoQin getListById(KaoQin kaoQin, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.getListById(kaoQin, c);
    }

    @Override
    public int add(KaoQin kaoQin, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.add(kaoQin, c);
    }

    @Override
    public int update(KaoQin kaoQin, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.update(kaoQin, c);
    }

    @Override
    public int delete(KaoQin kaoQin, String c) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.delete(kaoQin, c);
    }
}
