package com.yhocn.keshi_detail.controller;

import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.keshi_detail.service.KeshiDetailService;
import com.yhocn.shezhi.entity.Shezhi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
    public ModelAndView query(ModelAndView mv, Keshidetail ksd) {
        List<Keshidetail> list = service.getList(ksd);
        mv.addObject("list",list);
        mv.setViewName("/keshi/keshi_detail.jsp");
        return mv;
    }

    @RequestMapping("/getTeacherKeshiList")
    public ModelAndView getTeacherKeshiList(ModelAndView mv, Keshidetail ksd) {
        List<Keshidetail> list = service.getTeacherKeshiList(ksd);
        mv.addObject("teacherKeshiList",list);
        mv.setViewName("/teacher/kstj.jsp");
        return mv;
    }

    @RequestMapping("/toadd")
    public ModelAndView toadd(ModelAndView mv, Shezhi shezhi){
        List<Shezhi>shezhiList= service.shezhiList(shezhi);
        mv.addObject("shezhiList",shezhiList);
        mv.setViewName("/keshi/add.jsp");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(ModelAndView mv, Keshidetail ksd) {
        int i = service.add(ksd);
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
    public ModelAndView toupd(ModelAndView mv, Shezhi shezhi,Keshidetail ksd){
        Keshidetail keshidetail= service.getListById(ksd);
        List<Shezhi>shezhiList= service.shezhiList(shezhi);
        mv.addObject("shezhiList",shezhiList);
        mv.addObject("keshidetail",keshidetail);
        mv.setViewName("/keshi/update.jsp");
        return mv;
    }

    @RequestMapping("/upd")
    public ModelAndView update(ModelAndView mv, Keshidetail ksd) {
        int i = service.update(ksd);
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
    public ModelAndView delete(ModelAndView mv, Keshidetail ksd) {
        int i = service.delete(ksd);
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
