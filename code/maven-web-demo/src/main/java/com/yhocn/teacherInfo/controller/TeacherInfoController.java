package com.yhocn.teacherInfo.controller;

import com.yhocn.login.controller.LoginController;
import com.yhocn.pay.entity.Payment;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import com.yhocn.teacherInfo.service.TeacherInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hui
 * @date 2022/8/27 12:01
 */
@Controller
@RequestMapping("/teacherInfo")
public class TeacherInfoController {
    public int yeshu;
    public int weiye;

    @Autowired
    private TeacherInfoService service;

    @RequestMapping("/getList1")
    public ModelAndView getList1(ModelAndView mv, TeacherInfo t,String c, String t_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        if (request.getParameter("t_name") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name").trim();
        }
        yeshu = 1;
        page = 0;

        c = e.a;
        List<TeacherInfo> list = service.getList(t,c,t_name,page);
        List<TeacherInfo> list2 = service.getAllList(t,c);

        session.setAttribute("page", 1);
        weiye = (int) Math.floor(list2.size() / 10);

        mv.addObject("list", list);
        mv.setViewName("/teacherInfo/teacherInfo.jsp");
        return mv;
    }

    @RequestMapping("/getList2")
    public ModelAndView getList2(ModelAndView mv, TeacherInfo t,String c, String t_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("t_name") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name").trim();
        }

        if (yeshu > 1) {
            page = yeshu * 10 - 20;
        } else if (yeshu == 1) {
            page = yeshu * 10 - 10;
        } else {
            page = 0;
        }
        yeshu = yeshu - 1;
        if (yeshu < 1) {
            yeshu = 1;
        }

        List<TeacherInfo> list = service.getList(t,c,t_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/teacherInfo/teacherInfo.jsp");
        return mv;
    }

    @RequestMapping("/getList3")
    public ModelAndView getList3(ModelAndView mv, TeacherInfo t,String c, String t_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("t_name") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name").trim();
        }

        if (yeshu >= weiye) {
            yeshu = weiye;
        }
        page = yeshu * 10;
        yeshu = yeshu + 1;

        List<TeacherInfo> list = service.getList(t,c,t_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/teacherInfo/teacherInfo.jsp");
        return mv;
    }

    @RequestMapping("/getList4")
    public ModelAndView getList4(ModelAndView mv, TeacherInfo t,String c, String t_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("t_name") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name").trim();
        }

        page = weiye * 10;

        List<TeacherInfo> list = service.getList(t,c,t_name,page);
        session.setAttribute("page", weiye);

        mv.addObject("list", list);
        mv.setViewName("/teacherInfo/teacherInfo.jsp");
        return mv;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        c = e.a;
        int i = service.add(t, c);
        if (i > 0) {
            mv.addObject("msg", "增加成功");
            mv.setViewName("/teacherInfo/getList1.action");
        } else {
            mv.addObject("msg", "增加失败");
            mv.setViewName("/teacherInfo/getList1.action");
        }
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        c = e.a;
        TeacherInfo t2 = service.getListById(t, c);
        mv.addObject("teacherInfo", t2);
        mv.setViewName("/teacherInfo/update.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        c = e.a;
        int i = service.update(t, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
            mv.setViewName("/teacherInfo/getList1.action");
        } else {
            mv.addObject("msg", "修改失败");
            mv.setViewName("/teacherInfo/update.action");
        }
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        c = e.a;
        int i = service.delete(t, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
        } else {
            mv.addObject("msg", "修改失败");
        }
        mv.setViewName("/teacherInfo/getList1.action");
        return mv;
    }

}
