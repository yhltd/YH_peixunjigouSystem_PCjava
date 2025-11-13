package com.yhocn.teacher.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.teacher.mapper.TeacherMapper;
import com.yhocn.teacher.mapper.TeacherMssqlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherMssqlServiceImpl implements TeacherMssqlService {

    @Autowired
    private TeacherMssqlMapper dao;
    @Override
    public List<String> selectAll3() {
        try {
            DynamicDataSourceHolder.setDataSource("dataSource4");
            return dao.selectAll3();
        } finally {
            DynamicDataSourceHolder.clearDataSource();
        }
    }
}
