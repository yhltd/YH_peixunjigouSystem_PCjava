package com.yhocn.power.service;

import Bean.DynamicDataSourceHolder;
import com.yhocn.power.entity.Power;
import com.yhocn.power.mapper.PowerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/10 10:32
 */
@Service
public class PowerServiceImpl implements PowerService {
    @Autowired
    PowerMapper dao;

    @Override
    public List<Power> getAllList(Power p, String c) {
        return dao.getAllList(p, c);
    }

    @Override
    public List<Power> getList(Power p, String c, String view_name, Integer page) {
        return dao.getList(p, c, view_name, page);
    }

    @Override
    public Power getListById(Power p, String c) {
        return dao.getListById(p, c);
    }

    @Override
    public List<Power> getListByName(Integer t_id, String c) {
        DynamicDataSourceHolder.setDataSource("dataSource1");
        return dao.getListByName(t_id,c);
    }

    @Override
    public int add(Power p, String c) {
        return dao.add(p, c);
    }

    @Override
    public int update(Power p, String c) {
        return dao.update(p, c);
    }

    @Override
    public int delete(Power p, String c) {
        return dao.delete(p, c);
    }
}
