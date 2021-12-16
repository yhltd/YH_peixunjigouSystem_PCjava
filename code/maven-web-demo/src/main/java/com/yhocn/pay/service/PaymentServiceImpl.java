package com.yhocn.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhocn.pay.entity.Payment;
import com.yhocn.pay.mapper.PaymentMapper;
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper dao;
	
	@Override
	public List<Payment> selectAll(Payment p, String a, String b, String c, String d) {
		return dao.selectAll(p,a,b,c,d);
	}

	@Override
	public List<Payment> selectAll1(Payment p, String c) {
		return dao.selectAll1(p,c);
	}


	@Override
	public int add(Payment p, String c) {
		return dao.add(p,c);
	}

	@Override
	public int update(Payment p, String c) {
		return dao.update(p,c);
	}

	@Override
	public int delete(Payment p, String c) {
		return dao.delete(p,c);
	}


	@Override
	public Payment selectByRealname(Payment p, String c) {
		return dao.selectByRealname(p,c);
	}


	@Override
	public Payment selectById(Payment p, String c) {
		return dao.selectById(p,c);
	}



}
