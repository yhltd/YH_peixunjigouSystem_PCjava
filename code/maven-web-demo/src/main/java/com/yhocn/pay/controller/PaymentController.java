package com.yhocn.pay.controller;

import java.util.List;

import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.shezhi.service.ShezhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.pay.entity.Payment;
import com.yhocn.pay.service.PaymentService;
import com.yhocn.login.controller.LoginController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pay")
public class PaymentController {
    public int yeshu;
    public int weiye;

    @Autowired
    private PaymentService service;
    @Autowired
    private ShezhiService shezhiService;

    @RequestMapping("/payment1")
    public ModelAndView query(ModelAndView mv, Payment p, String a, String b, String c, String d, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("缴费记录")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        a = request.getParameter("date1");
        b = request.getParameter("date2");
		if (request.getParameter("realname") == null) {
			d = "";
		}else{
			d = request.getParameter("realname").trim();
		}


        yeshu = 1;
        page = 0;
        if (a == null || a.equals("")) {
            a = "1900/1/1";
        }
        if (b == null || b.equals("")) {
            b = "2300/1/1";
        }
        c = e.a;
        List<Payment> plist = service.selectAll(p, a, b, c, d, page);
        List<Payment> plistAll = service.selectAll1(p, c);

        session.setAttribute("page", 1);
        weiye = (int) Math.floor(plistAll.size() / 10);

        mv.addObject("plist", plist);
        mv.setViewName("/pay/payment.jsp");
        return mv;
    }

    @RequestMapping("/payment2")
    public ModelAndView query2(ModelAndView mv, Payment p, String a, String b, String c, String d, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        a = request.getParameter("date1");
        b = request.getParameter("date2");
		if (request.getParameter("realname") == null) {
			d = "";
		}else{
			d = request.getParameter("realname").trim();
		}

        if (a == null || a.equals("")) {
            a = "1900/1/1";
        }
        if (b == null || b.equals("")) {
            b = "2300/1/1";
        }
        c = e.a;

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

        session.setAttribute("page", yeshu);
        List<Payment> plist = service.selectAll(p, a, b, c, d, page);

        mv.addObject("plist", plist);
        mv.setViewName("/pay/payment.jsp");
        return mv;
    }

    @RequestMapping("/payment3")
    public ModelAndView query3(ModelAndView mv, Payment p, String a, String b, String c, String d, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        a = request.getParameter("date1");
        b = request.getParameter("date2");
		if (request.getParameter("realname") == null) {
			d = "";
		}else{
			d = request.getParameter("realname").trim();
		}

        if (a == null || a.equals("")) {
            a = "1900/1/1";
        }
        if (b == null || b.equals("")) {
            b = "2300/1/1";
        }
        c = e.a;

        if (yeshu >= weiye) {
            yeshu = weiye;
        }
        page = yeshu * 10;
        yeshu = yeshu + 1;

        session.setAttribute("page", yeshu);
        List<Payment> plist = service.selectAll(p, a, b, c, d, page);

        mv.addObject("plist", plist);
        mv.setViewName("/pay/payment.jsp");
        return mv;
    }

    @RequestMapping("/payment4")
    public ModelAndView query4(ModelAndView mv, Payment p, String a, String b, String c, String d, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        a = request.getParameter("date1");
        b = request.getParameter("date2");
		if (request.getParameter("realname") == null) {
			d = "";
		}else{
			d = request.getParameter("realname").trim();
		}

        if (a == null || a.equals("")) {
            a = "1900/1/1";
        }
        if (b == null || b.equals("")) {
            b = "2300/1/1";
        }
        c = e.a;

        page = weiye * 10;
        session.setAttribute("page", weiye);
        List<Payment> plist = service.selectAll(p, a, b, c, d, page);

        mv.addObject("plist", plist);
        mv.setViewName("/pay/payment.jsp");
        return mv;
    }


    @RequestMapping("/payment")
    public ModelAndView query1(ModelAndView mv, Payment p, String c, HttpServletRequest request) {

        LoginController e = new LoginController();
        c = e.a;
        List<Payment> plist = service.selectAll1(p, c);
        mv.addObject("plist", plist);
        mv.setViewName("/pay/payment.jsp");
        return mv;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Shezhi shezhi=new Shezhi();
        List<Shezhi> list= shezhiService.selectAll(shezhi,c);
        mv.addObject("shezhi", list);
        mv.setViewName("/pay/add.jsp");
        return mv;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ModelAndView add(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("缴费记录")&&e.quanxian.get(i).getAdd().equals("√")){
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
            mv.addObject("msg", "增加用户成功");
            mv.setViewName("/pay/payment1.action");
        } else {
            mv.addObject("msg", "增加用户失败");
            mv.setViewName("/pay/payment1.action");
        }
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        c = e.a;

        Shezhi shezhi=new Shezhi();
        List<Shezhi> list= shezhiService.selectAll(shezhi,c);
        Payment p2 = service.selectById(p, c);
        mv.addObject("shezhi", list);
        mv.addObject("payment", p2);
        mv.setViewName("/pay/update.jsp");

        return mv;
    }

    @RequestMapping("/toSelect")
    public ModelAndView toSelect(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Payment p2 = service.selectById(p, c);
        mv.addObject("payment", p2);
        mv.setViewName("/pay/select.jsp");

        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("缴费记录")&&e.quanxian.get(i).getUpd().equals("√")){
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
            mv.addObject("msg", "修改用户成功");
            mv.setViewName("/pay/payment1.action");
        } else {
            mv.addObject("msg", "修改用户失败");
            mv.setViewName("/pay/update.action");
        }
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, Payment p, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("缴费记录")&&e.quanxian.get(i).getDel().equals("√")){
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
            mv.addObject("msg", "删除用户成功");
        } else {
            mv.addObject("msg", "删除用户失败");
        }
        mv.setViewName("/pay/payment.action");
        return mv;
    }
}
