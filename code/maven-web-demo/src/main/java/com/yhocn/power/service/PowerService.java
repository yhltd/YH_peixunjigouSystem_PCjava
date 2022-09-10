package com.yhocn.power.service;

import com.yhocn.power.entity.Power;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/10 10:30
 */
public interface PowerService {
    public List<Power> getAllList(Power p, String c);
    public List<Power> getList(Power p, String c, String view_name, Integer page);
    public Power getListById(Power p, String c);
    public List<Power> getListByName(Integer t_id, String c);
    public int add(Power p, String c);
    public int update(Power p, String c);
    public int delete(Power p, String c);
}
