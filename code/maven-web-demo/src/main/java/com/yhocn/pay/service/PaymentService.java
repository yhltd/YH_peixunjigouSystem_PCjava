package com.yhocn.pay.service;

import java.util.List;
import com.yhocn.pay.entity.Payment;


public interface PaymentService {

	public List<Payment> selectAll(Payment p);
	public int add(Payment p);
	public int update(Payment p);
	public int delete(Payment p);
	public Payment selectById(Payment p);

	public Payment selectByRealname(Payment p);

}
