package com.yhocn.keshi_detail.service;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.shezhi.entity.Shezhi;

import java.util.List;

/**
 * @author wanghui
 * @date 2021/07/12 18:19
 */
public interface KeshiDetailService {
    public List<Keshidetail> getList(Keshidetail ksd);
    public List<Shezhi> shezhiList(Shezhi shezhi);
    public int add(Keshidetail ksd);
    public int update(Keshidetail ksd);
    public int delete(Keshidetail ksd);
    public Keshidetail getListById(Keshidetail ksd);
    public List<Keshidetail>getTeacherKeshiList(Keshidetail ksd);
}
