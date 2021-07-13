package com.yhocn.keshi_detail.mapper;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;

import java.util.List;

/**
 * @author wanghui
 * @date 2021/07/12 18:17
 */
public interface KeshiDetailMapper {
    public List<Keshidetail> getList(Keshidetail ksd);
    public List<Shezhi> shezhiList(Shezhi shezhi);
    public int add(Keshidetail ksd);
    public int update(Keshidetail ksd);
    public int delete(Keshidetail ksd);
    public Keshidetail getListById(Keshidetail ksd);
    public List<Keshidetail>getTeacherKeshiList(Keshidetail ksd);
}
