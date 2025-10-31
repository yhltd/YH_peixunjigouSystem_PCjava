package com.yhocn.kaoqin.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.course.mapper.CourseMapper;
import com.yhocn.kaoqin.entity.KaoQin;
import com.yhocn.kaoqin.mapper.KaoQinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/8 9:23
 */
@Service
public class KaoQinServiceImpl implements KaoQinService {
    @Autowired
    private KaoQinMapper dao;


    @Override
    public List<KaoQin> getAllList(KaoQin kaoQin, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getAllList(kaoQin, c);
    }

    @Override
    public List<KaoQin> getList(KaoQin kaoQin, String c, String s_name, Integer page) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getList(kaoQin, c, s_name, page);
    }

    @Override
    public KaoQin getListById(KaoQin kaoQin, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getListById(kaoQin, c);
    }

    @Override
    public int add(KaoQin kaoQin, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.add(kaoQin, c);
    }

    @Override
    public int update(KaoQin kaoQin, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.update(kaoQin, c);
    }

    @Override
    public int delete(KaoQin kaoQin, String c) {

        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.delete(kaoQin, c);
    }
}
