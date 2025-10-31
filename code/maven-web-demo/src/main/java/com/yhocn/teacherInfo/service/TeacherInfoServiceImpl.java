package com.yhocn.teacherInfo.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import com.yhocn.teacherInfo.mapper.TeacherInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/8/27 11:58
 */
@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {
    @Autowired
    @Qualifier("teacherInfoMapper")
    private TeacherInfoMapper dao;

    @Override
    public List<TeacherInfo> getAllList(TeacherInfo t, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getAllList(t, c);
    }

    @Override
    public List<TeacherInfo> getList(TeacherInfo t, String c, String t_name, Integer page) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getList(t, c, t_name, page);
    }

    @Override
    public TeacherInfo getListById(TeacherInfo t, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getListById(t, c);
    }

    @Override
    public int add(TeacherInfo t, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.add(t, c);
    }

    @Override
    public int update(TeacherInfo t, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.update(t, c);
    }

    @Override
    public int delete(TeacherInfo t, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.delete(t, c);
    }
}
