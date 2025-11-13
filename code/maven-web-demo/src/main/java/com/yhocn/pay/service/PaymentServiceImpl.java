package com.yhocn.pay.service;

import java.util.List;

import Bean.DynamicDataSourceHolder;
import com.yhocn.login.DataSourceSelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.pay.entity.Payment;
import com.yhocn.pay.mapper.PaymentMapper;
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper dao;
	
	@Override
	public List<Payment> selectAll(Payment p, String a, String b, String c, String d,Integer page) {

		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
			return dao.selectAll(p,a,b,c,d,page);
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
			return dao.selectAll_mssql(p,a,b,c,d,page);
		} else {
			System.out.println("用户不存在");
		}
		return null;

	}

	@Override
	public List<Payment> selectAll1(Payment p, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}

		return dao.selectAll1(p,c);
	}


	@Override
	public int add(Payment p, String c) {

		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.add(p,c);
	}

	@Override
	public int update(Payment p, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}

		return dao.update(p,c);
	}

	@Override
	public int delete(Payment p, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.delete(p,c);
	}


	@Override
	public Payment selectByRealname(Payment p, String c) {

		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
			return dao.selectByRealname(p,c);
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
			return dao.selectByRealname_mssql(p,c);
		} else {
			System.out.println("用户不存在");
		}
		return null;

	}


	@Override
	public Payment selectById(Payment p, String c) {
		String dataSourceType = DataSourceSelector.getDataSourceType();

		if ("mysql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource1");
		} else if ("mssql".equals(dataSourceType)) {
			DynamicDataSourceHolder.setDataSource("dataSource4");
		} else {
			System.out.println("用户不存在");
		}
		return dao.selectById(p,c);
	}



}
