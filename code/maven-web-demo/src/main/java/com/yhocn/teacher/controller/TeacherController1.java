package com.yhocn.teacher.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.service.TeacherService;
import com.yhocn.login.controller.LoginController;

@Controller
@RequestMapping("/tea1")
public class TeacherController1 {


    @Autowired
    private TeacherService service;
    @RequestMapping("/teacher2")
    @ResponseBody
    public String sendString(){    //user是与页面参数对应的JavaBean
        //map集合用来存放返回值
        List<Teacher> telist = service.selectAll1();
        List<String>gongsi=new ArrayList<>();
        for(int i=0;i<telist.size();i++){
            String gs= telist.get(i).getCompany();
            gongsi.add(gs);
        }
        Gson gson=new Gson();
        String result=gson.toJson(gongsi);
        return result;
    }
//    public ModelAndView query1(ModelAndView mv, HttpServletRequest request) {
//
//        List<Teacher> telist = service.selectAll1();
//        //request.setAttribute("list",telist);
//        mv.addObject("list",telist);
//        mv.setViewName("/main.jsp");
//        return mv;
//    }


}
