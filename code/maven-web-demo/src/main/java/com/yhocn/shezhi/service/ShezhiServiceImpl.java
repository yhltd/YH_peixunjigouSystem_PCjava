package com.yhocn.shezhi.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.shezhi.mapper.ShezhiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShezhiServiceImpl implements ShezhiService{

	@Autowired
	private ShezhiMapper dao;
	@Override
	public List<Shezhi> selectAll(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectAll(t,c);
	}

	@Override
	public Shezhi selectById(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectById(t,c);
	}

	@Override
	public int add(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.add(t,c);
	}

	@Override
	public int update(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.update(t,c);
	}

	@Override
	public int delete(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.delete(t,c);
	}

	@Override
	public List<Shezhi> selectByTeacher(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectByTeacher(t,c);
	}

	@Override
	public int alter(Shezhi t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.alter(t,c);
	}



}
