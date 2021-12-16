package com.yhocn.pay.mapper;

import java.util.List;

import com.yhocn.pay.entity.Payment;
import org.apache.ibatis.annotations.Param;

public interface PaymentMapper {

	public List<Payment> selectAll(@Param("p")Payment p,@Param("a")String a,@Param("b")String b,@Param("c")String c,@Param("d")String d);
	public List<Payment> selectAll1(@Param("p")Payment p,@Param("c")String c);
	public int add(@Param("p")Payment p,@Param("c")String c);
	public int update(@Param("p")Payment p,@Param("c")String c);
	public int delete(@Param("p")Payment p,@Param("c")String c);
	public Payment selectByRealname(@Param("p")Payment p,@Param("c")String c);
	public Payment selectById(@Param("p")Payment p,@Param("c")String c);


}
