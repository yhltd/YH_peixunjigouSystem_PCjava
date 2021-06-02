package com.yhocn.pay.mapper;

import java.util.List;

import com.yhocn.pay.entity.Payment;

public interface PaymentMapper {

	public List<Payment> selectAll(Payment p);
	public int add(Payment p);
	public int update(Payment p);
	public int delete(Payment p);
	public Payment selectByRealname(Payment p);
	public Payment selectById(Payment p);
}
