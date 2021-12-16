package com.yhocn.pay.service;

import java.util.List;
import com.yhocn.pay.entity.Payment;


public interface PaymentService {

	public List<Payment> selectAll(Payment p, String a, String b, String c, String d);
	public List<Payment> selectAll1(Payment p, String c);
	public int add(Payment p, String c);
	public int update(Payment p, String c);
	public int delete(Payment p, String c);
	public Payment selectById(Payment p, String c);

	public Payment selectByRealname(Payment p, String c);



}
