package com.yhocn.pushnews.controller;

import com.yhocn.pushnews.entity.PushNews;
import com.yhocn.pushnews.service.PushNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/pushnews")
public class PushNewsController {

    @Autowired
    private PushNewsService pushNewsService;

    @RequestMapping("/getnews")
    @ResponseBody  // 必须要有这个注解
    public List<PushNews> getnews(HttpSession session) {
        String companyName = (String) session.getAttribute("companyName");
        return pushNewsService.getList(companyName);
    }



}
