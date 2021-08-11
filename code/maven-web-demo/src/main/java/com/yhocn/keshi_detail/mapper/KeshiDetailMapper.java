package com.yhocn.keshi_detail.mapper;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.student.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wanghui
 * @date 2021/07/12 18:17
 */
public interface KeshiDetailMapper {
    public List<Keshidetail> getList(Keshidetail ksd,@Param("c")String c);
    public List<Keshidetail> getList1(Keshidetail ksd,@Param("c")String c,@Param("a")String a,@Param("b")String b);
    public List<Shezhi> shezhiList(Shezhi shezhi,@Param("c")String c);
    public int add(Keshidetail ksd,@Param("c")String c);
    public int update(Keshidetail ksd,@Param("c")String c);
    public int delete(Keshidetail ksd,@Param("c")String c);
    public Keshidetail getListById(Keshidetail ksd,@Param("c")String c);
    public List<Keshidetail>getTeacherKeshiList(Keshidetail ksd,@Param("c")String c);



}
