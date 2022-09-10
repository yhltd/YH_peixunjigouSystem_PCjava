package com.yhocn.power.controller;

import com.yhocn.login.controller.LoginController;
import com.yhocn.power.entity.Power;
import com.yhocn.power.service.PowerService;
import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hui
 * @date 2022/9/10 10:34
 */
@Controller
@RequestMapping("/power")
public class PowerController {
    public int yeshu;
    public int weiye;

    @Autowired
    private PowerService service;
    @Autowired
    private TeacherService service2;

    @RequestMapping("/getList1")
    public ModelAndView getList1(ModelAndView mv, Power p, String c, String view_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("权限管理")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        if (request.getParameter("view_name") == null) {
            view_name = "";
        }else{
            view_name = request.getParameter("view_name").trim();
        }
        yeshu = 1;
        page = 0;

        c = e.a;
        List<Power> list = service.getList(p,c,view_name,page);
        List<Power> list2 = service.getAllList(p,c);

        session.setAttribute("page", 1);
        weiye = (int) Math.floor(list2.size() / 10);

        mv.addObject("list", list);
        mv.setViewName("/power/power.jsp");
        return mv;
    }

    @RequestMapping("/getList2")
    public ModelAndView getList2(ModelAndView mv, Power p, String c, String view_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("view_name") == null) {
            view_name = "";
        }else{
            view_name = request.getParameter("view_name").trim();
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

        List<Power> list = service.getList(p,c,view_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/power/power.jsp");
        return mv;
    }

    @RequestMapping("/getList3")
    public ModelAndView getList3(ModelAndView mv, Power p, String c, String view_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("view_name") == null) {
            view_name = "";
        }else{
            view_name = request.getParameter("view_name").trim();
        }

        if (yeshu >= weiye) {
            yeshu = weiye;
        }
        page = yeshu * 10;
        yeshu = yeshu + 1;

        List<Power> list = service.getList(p,c,view_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/power/power.jsp");
        return mv;
    }

    @RequestMapping("/getList4")
    public ModelAndView getList4(ModelAndView mv, Power p, String c, String view_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("view_name") == null) {
            view_name = "";
        }else{
            view_name = request.getParameter("view_name").trim();
        }

        page = weiye * 10;

        List<Power> list = service.getList(p,c,view_name,page);
        session.setAttribute("page", weiye);

        mv.addObject("list", list);
        mv.setViewName("/power/power.jsp");
        return mv;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd(ModelAndView mv, Power p, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Teacher t=null;
        List<Teacher> tea = service2.selectAll(t,c);
        mv.addObject("tea", tea);
        mv.setViewName("/power/add.jsp");
        return mv;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mv, Power p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("权限管理")&&e.quanxian.get(i).getAdd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.add(p, c);
        if (i > 0) {
            mv.addObject("msg", "增加成功");
            mv.setViewName("/power/getList1.action");
        } else {
            mv.addObject("msg", "增加失败");
            mv.setViewName("/power/getList1.action");
        }
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(ModelAndView mv, Power p, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Power c2 = service.getListById(p, c);
        Teacher t=null;
        List<Teacher> tea = service2.selectAll(t,c);
        mv.addObject("power", c2);
        mv.addObject("tea", tea);
        mv.setViewName("/power/update.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, Power p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("权限管理")&&e.quanxian.get(i).getUpd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }

        c = e.a;
        int i = service.update(p, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
            mv.setViewName("/power/getList1.action");
        } else {
            mv.addObject("msg", "修改失败");
            mv.setViewName("/power/update.action");
        }
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, Power p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("权限管理")&&e.quanxian.get(i).getDel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.delete(p, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
        } else {
            mv.addObject("msg", "修改失败");
        }
        mv.setViewName("/power/getList1.action");
        return mv;
    }
}
