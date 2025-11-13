package com.yhocn.teacher.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yhocn.teacher.service.TeacherMssqlService;
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
@RequestMapping("/denglu")
public class TeacherController1 {


    @Autowired
    private TeacherService service;
    @Autowired
    private TeacherMssqlService service2;
    @RequestMapping(value="/xiala",produces = "text/plain;charset=UTF-8")
    @ResponseBody
//    public String sendString(HttpServletResponse resp){    //user是与页面参数对应的JavaBean
//        List<Teacher> telist = service.selectAll2();
//        List<String>gongsi=new ArrayList<>();
//        resp.setCharacterEncoding("UTF-8");
//        for(int i=0;i<telist.size();i++){
//            String gs= telist.get(i).getCompany();
//            gongsi.add(gs);
//        }
//        Gson gson=new Gson();
//        String result=gson.toJson(gongsi);
//        return result;
//    }
    public String sendString(HttpServletResponse resp) {
        List<Teacher> telist = service.selectAll2();
        List<String> telist1 = service2.selectAll3();


        // 使用Set自动去重
        Set<String> companySet = new HashSet<>();

        // 处理第一个列表（Teacher对象列表）
        for (Teacher teacher : telist) {
            String company = teacher.getCompany();
            if (company != null && !company.trim().isEmpty()) {
                companySet.add(company.trim());
            }
        }

        // 处理第二个列表（公司名称字符串列表）
        for (String company : telist1) {
            if (company != null && !company.trim().isEmpty()) {
                companySet.add(company.trim());
            }
        }

        // 转换为List并排序（可选）
        List<String> uniqueCompanies = new ArrayList<>(companySet);
        Collections.sort(uniqueCompanies);

        resp.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        String result = gson.toJson(uniqueCompanies);

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
