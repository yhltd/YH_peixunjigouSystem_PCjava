package com.yhocn.pay.mapper;

import java.util.List;

import com.yhocn.pay.entity.Payment;
import org.apache.ibatis.annotations.Param;

public interface PaymentMapper {

	public List<Payment> selectAll(Payment p,@Param("c")String c);
	public List<Payment> selectAll1(Payment p,@Param("c")String c,@Param("a")String a);
	public int add(Payment p,@Param("c")String c);
	public int update(Payment p,@Param("c")String c);
	public int delete(Payment p,@Param("c")String c);
	public Payment selectByRealname(Payment p,@Param("c")String c);
	public Payment selectById(Payment p,@Param("c")String c);
}
