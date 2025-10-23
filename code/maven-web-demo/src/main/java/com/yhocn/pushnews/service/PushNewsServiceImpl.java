package com.yhocn.pushnews.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.pushnews.entity.PushNews;
import com.yhocn.pushnews.mapper.PushNewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PushNewsServiceImpl implements PushNewsService {

    @Autowired
    PushNewsMapper pm;

    @Override
    public List<PushNews> getList(String companyName) {
            DynamicDataSourceHolder.setDataSource("dataSource3");
            return pm.getList(companyName);

    }

    public List<PushNews> getLogin(String companyName) {
        DynamicDataSourceHolder.setDataSource("dataSource3");
        return pm.getList(companyName);

    }
}