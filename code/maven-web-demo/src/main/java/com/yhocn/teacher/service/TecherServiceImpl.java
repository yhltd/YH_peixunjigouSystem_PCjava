package com.yhocn.teacher.service;

import java.util.List;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.mapper.TeacherMapper;
@Service
public class TecherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper dao;
	@Override
	public List<Teacher> selectAll(Teacher t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();
		System.out.println("数据源判断值"+dataSourceType);
		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
			System.out.println("数据源1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
			System.out.println("数据源4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectAll(t,c);
	}

	@Override
	public List<Teacher> selectAll1(Teacher t, String c, String a, String b, String d) {

		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
			return dao.selectAll1(t,c,a,b,d);
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
			return dao.selectAll1_mssql(t,c,a,b,d);
		} else {
			System.out.println("用户不存在");
		}
		return null;


	}
	@Override
	public List<Teacher> selectAll2() {

		DynamicDataSourceHolder.setDataSource("dataSource1");
		return dao.selectAll2();
	}

	@Override
	public Teacher selectById(Teacher t, String c) {
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
	public int add(Teacher t, String c) {
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
	public int update(Teacher t, String c) {
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
	public int delete(Teacher t, String c) {
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
	public List<Teacher> selectByRealName(Teacher t, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectByRealName(t,c);
	}

	@Override
	public int alter(Teacher t, String c) {
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
