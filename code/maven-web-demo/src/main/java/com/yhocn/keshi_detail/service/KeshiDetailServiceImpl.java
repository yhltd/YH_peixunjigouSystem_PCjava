package com.yhocn.keshi_detail.service;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.keshi_detail.mapper.KeshiDetailMapper;
import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wanghui
 * @date 2021/07/12 18:20
 */
@Service
public class KeshiDetailServiceImpl implements KeshiDetailService {
    @Autowired
    public KeshiDetailMapper km;

    @Override
    public List<Keshidetail> getList(Keshidetail ksd, String c,String a,String b,String d,String f,Integer page) {
        return km.getList(ksd,c,a,b,d,f,page);
    }
    @Override
    public List<Keshidetail> getList1(Keshidetail ksd, String c,String a,String b,String d,String f,Integer page) {
        return km.getList1(ksd,c,a,b,d,f,page);
    }
    @Override
    public List<Keshidetail> select(Keshidetail ksd, String c,String a,String d,String f) {
        return km.select(ksd,c,a,d,f);
    }
    @Override
    public List<Keshidetail> select1(Keshidetail ksd, String c,String a) {
        return km.select1(ksd,c,a);
    }
    @Override
    public List<Shezhi> shezhiList(Shezhi shezhi, String c) {
        return km.shezhiList(shezhi,c);
    }

    @Override
    public int add(Keshidetail ksd, String c) {
        return km.add(ksd,c);
    }

    @Override
    public int update(Keshidetail ksd, String c) {
        return km.update(ksd,c);
    }

    @Override
    public int delete(Keshidetail ksd, String c) {
        return km.delete(ksd,c);
    }

    @Override
    public Keshidetail getListById(Keshidetail ksd, String c) {
        return km.getListById(ksd,c);
    }

    @Override
    public List<Keshidetail> getTeacherKeshiList(Keshidetail ksd, String c) {
        return km.getTeacherKeshiList(ksd,c);
    }

}
