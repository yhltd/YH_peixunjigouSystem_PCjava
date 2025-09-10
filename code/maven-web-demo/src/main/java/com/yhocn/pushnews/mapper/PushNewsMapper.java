package com.yhocn.pushnews.mapper;

import com.yhocn.pushnews.entity.PushNews;
//import jdk.jfr.SettingDefinition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PushNewsMapper {
    public List<PushNews> getList(@Param("companyName") String companyName);
}
