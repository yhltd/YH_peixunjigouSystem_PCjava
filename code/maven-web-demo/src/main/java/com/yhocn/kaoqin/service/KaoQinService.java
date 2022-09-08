package com.yhocn.kaoqin.service;

import com.yhocn.kaoqin.entity.KaoQin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author hui
 * @date 2022/9/8 9:16
 */
public interface KaoQinService {
    public List<KaoQin> getAllList(KaoQin kaoQin,String c);

    public List<KaoQin> getList(KaoQin kaoQin, String c, String s_name, Integer page);

    public KaoQin getListById(KaoQin kaoQin,String c);

    public int add(KaoQin kaoQin, String c);

    public int update(KaoQin kaoQin, String c);

    public int delete(KaoQin kaoQin, String c);
}
