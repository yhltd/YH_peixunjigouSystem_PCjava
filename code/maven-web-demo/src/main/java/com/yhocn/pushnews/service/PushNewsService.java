package com.yhocn.pushnews.service;

import com.yhocn.pushnews.entity.PushNews;

import java.util.List;

public interface PushNewsService {
    public List<PushNews> getList(String companyName);
}
