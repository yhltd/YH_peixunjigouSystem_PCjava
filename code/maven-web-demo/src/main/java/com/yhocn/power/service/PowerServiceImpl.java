package com.yhocn.power.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import com.yhocn.power.entity.Power;
import com.yhocn.power.mapper.PowerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/10 10:32
 */
@Service
public class PowerServiceImpl implements PowerService {
    @Autowired
    PowerMapper dao;

    @Override
    public List<Power> getAllList(Power p, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getAllList(p, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getAllList_mssql(p, c);
        } else {
            System.out.println("用户不存在");
        }
        return null;
    }

    @Override
    public List<Power> getList(Power p, String c, String view_name, Integer page) {

        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getList(p, c, view_name, page);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getList_mssql(p, c, view_name, page);
        } else {
            System.out.println("用户不存在");
        }
        return null;

    }

    @Override
    public Power getListById(Power p, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getListById(p, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getListById_mssql(p, c);
        } else {
            System.out.println("用户不存在");
        }
        return null;
    }

    @Override
    public List<Power> getListByName(Integer t_id, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.getListByName(t_id,c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.getListByName_mssql(t_id,c);
        } else {
            System.out.println("用户不存在");
        }
        return null;
    }

    @Override
    public int add(Power p, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.add(p, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.add_mssql(p, c);
        } else {
            System.out.println("用户不存在");
        }
        return 0;
    }

    @Override
    public int update(Power p, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
            return dao.update(p, c);
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.update_mssql(p, c);
        } else {
            System.out.println("用户不存在");
        }
        return 0;
    }

    @Override
    public int delete(Power p, String c) {
        String dataSourceType = DataSourceSelector.getDataSourceType();

        if ("mysql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource1");
        } else if ("mssql".equals(dataSourceType)) {
            DynamicDataSourceHolder.setDataSource("dataSource4");
        } else {
            System.out.println("用户不存在");
        }
        return dao.delete(p, c);
    }
}
