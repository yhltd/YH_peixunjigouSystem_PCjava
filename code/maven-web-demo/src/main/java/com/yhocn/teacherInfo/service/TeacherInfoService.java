package com.yhocn.teacherInfo.service;

import com.yhocn.teacherInfo.entity.TeacherInfo;

import java.util.List;

/**
 * @author hui
 * @date 2022/8/27 11:56
 */
public interface TeacherInfoService {
    public List<TeacherInfo> getAllList(TeacherInfo t, String c);
    public List<TeacherInfo> getList(TeacherInfo t, String c,String t_name,Integer page);
    public TeacherInfo getListById(TeacherInfo t, String c);
    public int add(TeacherInfo t, String c);
    public int update(TeacherInfo t, String c);
    public int delete(TeacherInfo t, String c);
}
