package com.yhocn.course.controller;

import com.yhocn.course.entity.Course;
import com.yhocn.course.service.CourseService;
import com.yhocn.login.controller.LoginController;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import com.yhocn.teacherInfo.service.TeacherInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hui
 * @date 2022/9/7 17:19
 */
@Controller
@RequestMapping("/course")
public class CourseController {
    public int yeshu;
    public int weiye;

    @Autowired
    private CourseService service;

    @RequestMapping("/getList1")
    public ModelAndView getList1(ModelAndView mv, Course course, String c, String teacher, String cou, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师课表")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        if (request.getParameter("teacher_sel") == null) {
            teacher = "";
        }else{
            teacher = request.getParameter("teacher_sel").trim();
        }
        if (request.getParameter("cou_sel") == null) {
            cou = "";
        }else{
            cou = request.getParameter("cou_sel").trim();
        }
        yeshu = 1;
        page = 0;

        c = e.a;
        List<Course> list = service.getList(course,c,teacher,cou,page);
        List<Course> list2 = service.getAllList(course,c);

        session.setAttribute("page", 1);
        weiye = (int) Math.floor(list2.size() / 10);

        mv.addObject("list", list);
        mv.setViewName("/course/course.jsp");
        return mv;
    }

    @RequestMapping("/getList2")
    public ModelAndView getList2(ModelAndView mv, Course course, String c, String teacher, String cou, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("teacher_sel") == null) {
            teacher = "";
        }else{
            teacher = request.getParameter("teacher_sel").trim();
        }
        if (request.getParameter("cou_sel") == null) {
            cou = "";
        }else{
            cou = request.getParameter("cou_sel").trim();
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

        List<Course> list = service.getList(course,c,teacher,cou,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/course/course.jsp");
        return mv;
    }

    @RequestMapping("/getList3")
    public ModelAndView getList3(ModelAndView mv, Course course, String c, String teacher, String cou, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("teacher_sel") == null) {
            teacher = "";
        }else{
            teacher = request.getParameter("teacher_sel").trim();
        }
        if (request.getParameter("cou_sel") == null) {
            cou = "";
        }else{
            cou = request.getParameter("cou_sel").trim();
        }

        if (yeshu >= weiye) {
            yeshu = weiye;
        }
        page = yeshu * 10;
        yeshu = yeshu + 1;

        List<Course> list = service.getList(course,c,teacher,cou,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/course/course.jsp");
        return mv;
    }

    @RequestMapping("/getList4")
    public ModelAndView getList4(ModelAndView mv, Course course, String c, String teacher, String cou, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("teacher_sel") == null) {
            teacher = "";
        }else{
            teacher = request.getParameter("teacher_sel").trim();
        }
        if (request.getParameter("cou_sel") == null) {
            cou = "";
        }else{
            cou = request.getParameter("cou_sel").trim();
        }

        page = weiye * 10;

        List<Course> list = service.getList(course,c,teacher,cou,page);
        session.setAttribute("page", weiye);

        mv.addObject("list", list);
        mv.setViewName("/course/course.jsp");
        return mv;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mv, Course course, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师课表")&&e.quanxian.get(i).getAdd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }

        c = e.a;
        int i = service.add(course, c);
        if (i > 0) {
            mv.addObject("msg", "增加成功");
            mv.setViewName("/course/getList1.action");
        } else {
            mv.addObject("msg", "增加失败");
            mv.setViewName("/course/getList1.action");
        }
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(ModelAndView mv, Course course, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Course c2 = service.getListById(course, c);
        mv.addObject("course", c2);
        mv.setViewName("/course/update.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, Course course, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师课表")&&e.quanxian.get(i).getUpd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.update(course, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
            mv.setViewName("/course/getList1.action");
        } else {
            mv.addObject("msg", "修改失败");
            mv.setViewName("/course/update.action");
        }
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, Course course, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师课表")&&e.quanxian.get(i).getDel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.delete(course, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
        } else {
            mv.addObject("msg", "修改失败");
        }
        mv.setViewName("/course/getList1.action");
        return mv;
    }


}
