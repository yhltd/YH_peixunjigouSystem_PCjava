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
    public List<Keshidetail> getList(@Param("ksd")Keshidetail ksd,@Param("c")String c,@Param("a")String a,@Param("b")String b,@Param("d")String d,@Param("f")String f,@Param("page")Integer page);

    public List<Keshidetail> getList1(@Param("ksd")Keshidetail ksd,@Param("c")String c,@Param("a")String a,@Param("b")String b,@Param("d")String d,@Param("f")String f,@Param("page")Integer page);
    public List<Shezhi> shezhiList(@Param("shezhi")Shezhi shezhi,@Param("c")String c);
    public int add(@Param("ksd")Keshidetail ksd,@Param("c")String c);
    public int update(@Param("ksd")Keshidetail ksd,@Param("c")String c);
    public int delete(@Param("ksd")Keshidetail ksd,@Param("c")String c);
    public Keshidetail getListById(@Param("ksd")Keshidetail ksd,@Param("c")String c);
    public List<Keshidetail>getTeacherKeshiList(@Param("ksd")Keshidetail ksd,@Param("c")String c);


    public List<Keshidetail> select(@Param("ksd") Keshidetail ksd, @Param("c") String c, @Param("a") String a,@Param("d")String d,@Param("f")String f);
    public List<Keshidetail> select1(@Param("ksd") Keshidetail ksd, @Param("c") String c, @Param("a") String a);
}
