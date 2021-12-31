package com.yhocn.keshi_detail.service;

import com.yhocn.income.entity.Income;
import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.shezhi.entity.Shezhi;

import java.util.List;

/**
 * @author wanghui
 * @date 2021/07/12 18:19
 */
public interface KeshiDetailService {
    public List<Keshidetail> getList(Keshidetail ksd, String c,String a,String b,String d,String f,Integer page);
    public List<Shezhi> shezhiList(Shezhi shezhi, String c);
    public int add(Keshidetail ksd, String c);
    public int update(Keshidetail ksd, String c);
    public int delete(Keshidetail ksd, String c);
    public Keshidetail getListById(Keshidetail ksd, String c);
    public List<Keshidetail>getTeacherKeshiList(Keshidetail ksd, String c);

    public List<Keshidetail> getList1(Keshidetail ksd, String c,String a,String b,String d,String f,Integer page);

    List<Keshidetail> select(Keshidetail ksd, String a, String c,String d,String f);
    List<Keshidetail> select1(Keshidetail ksd, String a, String c);
}
