package com.yhocn.teacherInfo.mapper;

import com.yhocn.teacherInfo.entity.TeacherInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hui
 * @date 2022/8/27 11:52
 */
public interface TeacherInfoMapper {
    public List<TeacherInfo> getAllList(@Param("t") TeacherInfo t, @Param("c") String c);

    public List<TeacherInfo> getList(@Param("t") TeacherInfo t, @Param("c") String c, @Param("t_name") String t_name, @Param("page") Integer page);

    public TeacherInfo getListById(@Param("t") TeacherInfo t, @Param("c") String c);

    public int add(@Param("t") TeacherInfo t, @Param("c") String c);

    public int update(@Param("t") TeacherInfo t, @Param("c") String c);

    public int delete(@Param("t") TeacherInfo t, @Param("c") String c);

}
