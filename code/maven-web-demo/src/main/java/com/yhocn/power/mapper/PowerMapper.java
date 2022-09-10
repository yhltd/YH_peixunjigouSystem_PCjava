package com.yhocn.power.mapper;

import com.yhocn.course.entity.Course;
import com.yhocn.power.entity.Power;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/10 10:28
 */
public interface PowerMapper {
    public List<Power> getAllList(@Param("p") Power p, @Param("c") String c);

    public List<Power> getList(@Param("p") Power p, @Param("c") String c, @Param("view_name") String view_name, @Param("page")Integer page);

    public Power getListById(@Param("p") Power p, @Param("c") String c);

    public List<Power> getListByName(@Param("t_id") Integer t_id, @Param("c") String c);

    public int add(@Param("p") Power p, @Param("c") String c);

    public int update(@Param("p") Power p, @Param("c") String c);

    public int delete(@Param("p") Power p, @Param("c") String c);
}
