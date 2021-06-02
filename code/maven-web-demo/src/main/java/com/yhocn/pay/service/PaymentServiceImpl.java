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
	public List<Payment> selectAll(Payment p) {
		return dao.selectAll(p);
	}


	@Override
	public int add(Payment p) {
		return dao.add(p);
	}

	@Override
	public int update(Payment p) {
		return dao.update(p);
	}

	@Override
	public int delete(Payment p) {
		return dao.delete(p);
	}


	@Override
	public Payment selectByRealname(Payment p) {
		return dao.selectByRealname(p);
	}


	@Override
	public Payment selectById(Payment p) {
		return dao.selectById(p);
	}



}
