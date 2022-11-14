package com.yhocn.kaoqin.controller;

import com.yhocn.kaoqin.entity.KaoQin;
import com.yhocn.kaoqin.service.KaoQinService;
import com.yhocn.login.controller.LoginController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hui
 * @date 2022/9/8 9:26
 */
@Controller
@RequestMapping("/kaoqin")
public class KaoQinController {
    public int yeshu;
    public int weiye;

    @Autowired
    private KaoQinService service;

    @RequestMapping("/getList1")
    public ModelAndView getList1(ModelAndView mv, KaoQin kaoQin, String c, String s_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("考勤表")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        if (request.getParameter("s_name_sel") == null) {
            s_name = "";
        }else{
            s_name = request.getParameter("s_name_sel").trim();
        }
        yeshu = 1;
        page = 0;

        c = e.a;
        List<KaoQin> list = service.getList(kaoQin,c,s_name,page);
        List<KaoQin> list2 = service.getAllList(kaoQin,c);

        session.setAttribute("page", 1);
        weiye = (int) Math.floor(list2.size() / 10);

        mv.addObject("list", list);
        mv.setViewName("/kaoqin/kaoqin.jsp");
        return mv;
    }

    @RequestMapping("/getList2")
    public ModelAndView getList2(ModelAndView mv, KaoQin kaoQin, String c, String s_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("s_name_sel") == null) {
            s_name = "";
        }else{
            s_name = request.getParameter("s_name_sel").trim();
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

        List<KaoQin> list = service.getList(kaoQin,c,s_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/kaoqin/kaoqin.jsp");
        return mv;
    }

    @RequestMapping("/getList3")
    public ModelAndView getList3(ModelAndView mv, KaoQin kaoQin, String c, String s_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("s_name_sel") == null) {
            s_name = "";
        }else{
            s_name = request.getParameter("s_name_sel").trim();
        }

        if (yeshu >= weiye) {
            yeshu = weiye;
        }
        page = yeshu * 10;
        yeshu = yeshu + 1;

        List<KaoQin> list = service.getList(kaoQin,c,s_name,page);
        session.setAttribute("page", yeshu);

        mv.addObject("list", list);
        mv.setViewName("/kaoqin/kaoqin.jsp");
        return mv;
    }

    @RequestMapping("/getList4")
    public ModelAndView getList4(ModelAndView mv, KaoQin kaoQin, String c, String s_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        c = e.a;
        if (request.getParameter("s_name_sel") == null) {
            s_name = "";
        }else{
            s_name = request.getParameter("s_name_sel").trim();
        }

        page = weiye * 10;

        List<KaoQin> list = service.getList(kaoQin,c,s_name,page);
        session.setAttribute("page", weiye);

        mv.addObject("list", list);
        mv.setViewName("/kaoqin/kaoqin.jsp");
        return mv;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mv, KaoQin kaoQin, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("考勤表")&&e.quanxian.get(i).getAdd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.add(kaoQin, c);
        if (i > 0) {
            mv.addObject("msg", "增加成功");
            mv.setViewName("/kaoqin/getList1.action");
        } else {
            mv.addObject("msg", "增加失败");
            mv.setViewName("/kaoqin/getList1.action");
        }
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(ModelAndView mv, KaoQin kaoQin, String c) {
        LoginController e = new LoginController();
        c = e.a;
        KaoQin kq = service.getListById(kaoQin, c);
        mv.addObject("kaoqin", kq);
        mv.setViewName("/kaoqin/update.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, KaoQin kaoQin, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("考勤表")&&e.quanxian.get(i).getUpd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.update(kaoQin, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
            mv.setViewName("/kaoqin/getList1.action");
        } else {
            mv.addObject("msg", "修改失败");
            mv.setViewName("/kaoqin/update.action");
        }
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, KaoQin kaoQin, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("考勤表")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        c = e.a;
        int i = service.delete(kaoQin, c);
        if (i > 0) {
            mv.addObject("msg", "修改成功");
        } else {
            mv.addObject("msg", "修改失败");
        }
        mv.setViewName("/kaoqin/getList1.action");
        return mv;
    }
}
