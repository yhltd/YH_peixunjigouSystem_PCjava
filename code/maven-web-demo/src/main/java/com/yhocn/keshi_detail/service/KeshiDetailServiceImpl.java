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
    public List<Keshidetail> getList(Keshidetail ksd) {
        return km.getList(ksd);
    }

    @Override
    public List<Shezhi> shezhiList(Shezhi shezhi) {
        return km.shezhiList(shezhi);
    }

    @Override
    public int add(Keshidetail ksd) {
        return km.add(ksd);
    }

    @Override
    public int update(Keshidetail ksd) {
        return km.update(ksd);
    }

    @Override
    public int delete(Keshidetail ksd) {
        return km.delete(ksd);
    }

    @Override
    public Keshidetail getListById(Keshidetail ksd) {
        return km.getListById(ksd);
    }

    @Override
    public List<Keshidetail> getTeacherKeshiList(Keshidetail ksd) {
        return km.getTeacherKeshiList(ksd);
    }

}
