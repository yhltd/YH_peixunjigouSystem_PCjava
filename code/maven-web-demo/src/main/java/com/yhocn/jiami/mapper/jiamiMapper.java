package com.yhocn.jiami.mapper;

import com.yhocn.jiami.eneity.jiami;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface jiamiMapper {

	public List<jiami> selectAllJiami(@Param("name")String name);
}
