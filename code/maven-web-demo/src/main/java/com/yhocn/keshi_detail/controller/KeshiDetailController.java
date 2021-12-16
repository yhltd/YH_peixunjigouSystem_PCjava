package com.yhocn.keshi_detail.controller;

import com.yhocn.income.entity.Income;
import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.keshi_detail.service.KeshiDetailService;
import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.List;
import com.yhocn.login.controller.LoginController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wanghui
 * @date 2021/07/12 18:22
 */
@Controller
@RequestMapping("/keshi")
public class KeshiDetailController {
    @Autowired
    private KeshiDetailService service;

    @RequestMapping("/getList")
    public ModelAndView query(ModelAndView mv, Keshidetail ksd, String c) {
        LoginController e=new  LoginController();
        c=e.a;
        List<Keshidetail> list = service.getList(ksd,c);

        mv.addObject("list",list);
        mv.setViewName("/keshi/keshi_detail.jsp");
        return mv;
    }
    @RequestMapping("/getList1")
    public ModelAndView query1(ModelAndView mv, Keshidetail ksd, String c, String a, String b,String d,String f, HttpServletRequest request) {
        a=request.getParameter("teacher_name").trim();
        b=request.getParameter("course").trim();
        d=request.getParameter("date1");
        f=request.getParameter("date2");
        if(d.equals("")){
            d="1900/1/1";
        }
        if(f.equals("")){
            f="2300/1/1";
        }
        LoginController e=new  LoginController();
        c=e.a;
        List<Keshidetail> list = service.getList1(ksd,c,a,b,d,f);
        mv.addObject("list",list);
        mv.setViewName("/keshi/keshi_detail.jsp");
        return mv;
    }

    @RequestMapping("/getTeacherKeshiList")
    public ModelAndView getTeacherKeshiList(ModelAndView mv, Keshidetail ksd, String c) {
        LoginController e=new  LoginController();
        c=e.a;
        List<Keshidetail> list = service.getTeacherKeshiList(ksd,c);
        mv.addObject("teacherKeshiList",list);
        mv.setViewName("/teacher/kstj.jsp");
        return mv;
    }
    @RequestMapping("/select")
    public ModelAndView info(ModelAndView mv, Keshidetail ksd, String a ,String c,String d,String f, HttpServletRequest request) {
        a=request.getParameter("teacher_name").trim();
        d=request.getParameter("date1");
        f=request.getParameter("date2");
        if(d.equals("")){
            d="1900/1/1";
        }
        if(f.equals("")){
            f="2300/1/1";
        }
        LoginController e=new  LoginController();
        c=e.a;
        List<Keshidetail> list = service.select(ksd,c,a,d,f);
        mv.addObject("teacherKeshiList",list);
        mv.setViewName("/teacher/kstj.jsp");
        return mv;
    }
    @RequestMapping("/select1")
    public ModelAndView info1(ModelAndView mv, Keshidetail ksd, String a ,String c, HttpServletRequest request) {
       a=request.getParameter("date2");
//        String strDateFormat = "yyyy-MM";
//        SimpleDateFormat sdf = new SimpleDateFormat(a);
        if (!a.equals("")){
        String s1[]=a.split("-");
        a=s1[0]+ "-" + s1[1];}
        LoginController e=new  LoginController();
        c=e.a;
        List<Keshidetail> list = service.select1(ksd,c,a);
        mv.addObject("teacherKeshiList",list);
        mv.setViewName("/tea/jisuan.jsp");
        return mv;
    }
    @RequestMapping("/toadd")
    public ModelAndView toadd(ModelAndView mv, Shezhi shezhi, String c){
        LoginController e=new  LoginController();
        c=e.a;
        List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
        mv.addObject("shezhiList",shezhiList);
        mv.setViewName("/keshi/add.jsp");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(ModelAndView mv, Keshidetail ksd, String c) {
        LoginController e=new  LoginController();
        c=e.a;
        int i = service.add(ksd,c);
        if(i>0) {
            mv.addObject("msg","增加用户成功");
            mv.setViewName("/keshi/getList.action");
        }else {
            mv.addObject("msg","增加用户失败");
            mv.setViewName("/keshi/add.jsp");
        }
        return mv;
    }

    @RequestMapping("/toupd")
    public ModelAndView toupd(ModelAndView mv, Shezhi shezhi,Keshidetail ksd, String c){
        LoginController e=new  LoginController();
        c=e.a;
        Keshidetail keshidetail= service.getListById(ksd,c);
        List<Shezhi>shezhiList= service.shezhiList(shezhi,c);
        mv.addObject("shezhiList",shezhiList);
        mv.addObject("keshidetail",keshidetail);
        mv.setViewName("/keshi/update.jsp");
        return mv;
    }

    @RequestMapping("/upd")
    public ModelAndView update(ModelAndView mv, Keshidetail ksd, String c) {
        LoginController e=new  LoginController();
        c=e.a;
        int i = service.update(ksd,c);
        if(i>0) {
            mv.addObject("msg","修改用户成功");
            mv.setViewName("/keshi/getList.action");
        }else {
            mv.addObject("msg","修改用户失败");
            mv.setViewName("/keshi/update.jsp");
        }
        return mv;
    }

    @RequestMapping("/del")
    public ModelAndView delete(ModelAndView mv, Keshidetail ksd, String c) {
        LoginController e=new  LoginController();
        c=e.a;
        int i = service.delete(ksd,c);
        if(i>0) {
            mv.addObject("msg","删除用户成功");
            mv.setViewName("/keshi/student.jsp");
        }else {
            mv.addObject("msg","删除用户失败");
            mv.setViewName("/keshi/add.jsp");
        }
        mv.setViewName("/keshi/getList.action");
        return mv;
    }



}
