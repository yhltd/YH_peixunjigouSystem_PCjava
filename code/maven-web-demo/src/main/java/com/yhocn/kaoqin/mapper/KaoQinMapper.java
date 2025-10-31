package com.yhocn.kaoqin.mapper;

import com.yhocn.kaoqin.entity.KaoQin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/8 9:17
 */
@Mapper
public interface KaoQinMapper {
    public List<KaoQin> getAllList(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c);

    public List<KaoQin> getList(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c, @Param("s_name") String s_name, @Param("page") Integer page);

    public KaoQin getListById(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c);

    public int add(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c);

    public int update(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c);

    public int delete(@Param("kaoQin") KaoQin kaoQin, @Param("c") String c);
}
