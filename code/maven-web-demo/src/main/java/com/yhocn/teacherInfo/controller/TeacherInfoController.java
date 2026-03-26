package com.yhocn.teacherInfo.controller;

import com.yhocn.login.controller.LoginController;
import com.yhocn.pay.entity.Payment;
import com.yhocn.shezhi.entity.Shezhi;
import com.yhocn.shezhi.service.ShezhiService;
import com.yhocn.teacherInfo.entity.TeacherInfo;
import com.yhocn.teacherInfo.service.TeacherInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private ShezhiService shezhiService;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/getList1")
    public ModelAndView getList1(ModelAndView mv, TeacherInfo t,String c, String t_name, Integer page, HttpServletRequest request, HttpSession session) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师信息")&&e.quanxian.get(i).getSel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        if (request.getParameter("t_name_sel") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name_sel").trim();
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
        if (request.getParameter("t_name_sel") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name_sel").trim();
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
        if (request.getParameter("t_name_sel") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name_sel").trim();
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
        if (request.getParameter("t_name_sel") == null) {
            t_name = "";
        }else{
            t_name = request.getParameter("t_name_sel").trim();
        }

        page = weiye * 10;

        List<TeacherInfo> list = service.getList(t,c,t_name,page);
        session.setAttribute("page", weiye);

        mv.addObject("list", list);
        mv.setViewName("/teacherInfo/teacherInfo.jsp");
        return mv;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        c = e.a;
        Shezhi shezhi=new Shezhi();
        List<Shezhi> list= shezhiService.selectAll(shezhi,c);
        mv.addObject("shezhi", list);
        mv.setViewName("/teacherInfo/add.jsp");
        return mv;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师信息")&&e.quanxian.get(i).getAdd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }

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
        Shezhi shezhi=new Shezhi();
        TeacherInfo t2 = service.getListById(t, c);
        List<Shezhi> list= shezhiService.selectAll(shezhi,c);
        mv.addObject("shezhi", list);
        mv.addObject("teacherInfo", t2);
        mv.setViewName("/teacherInfo/update.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师信息")&&e.quanxian.get(i).getUpd().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
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

    @RequestMapping("/wenjian")
    public ModelAndView upwenjian(ModelAndView mv,
                                  @RequestParam("up_id") Integer up_id,
                                  @RequestParam("up_wenjian") String up_wenjian) {
        LoginController e = new LoginController();
        boolean pd = false;

        // 权限检查
        for (int i = 0; i < e.quanxian.size(); i++) {
            if (e.quanxian.get(i).getView_name().equals("教师信息") &&
                    e.quanxian.get(i).getUpd().equals("√")) {
                pd = true;
            }
        }

        if (!pd) {
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
        // 调用 service 更新
        int i = service.updateWenjian(up_id,up_wenjian);  // 需要对应的 service 方法

        if (i > 0) {
            mv.addObject("msg", "文件信息更新成功");
        } else {
            mv.addObject("msg", "文件信息更新失败");
        }

        mv.setViewName("/teacherInfo/getList1.action");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(ModelAndView mv, TeacherInfo t, String c) {
        LoginController e = new LoginController();
        boolean pd=false;
        for (int i=0;i<e.quanxian.size();i++){
            if(e.quanxian.get(i).getView_name().equals("教师信息")&&e.quanxian.get(i).getDel().equals("√")){
                pd=true;
            }
        }
        if(!pd){
            mv.addObject("msg", "无权限");
            mv.setViewName("/main.jsp");
            return mv;
        }
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

    /**
     * 表名与公司字段名的映射关系
     */
    private Map<String, String> getCompanyColumnMap() {
        Map<String, String> map = new HashMap<>();
        map.put("course", "company");
        map.put("income", "Company");
        map.put("kaoqin", "company");
        map.put("keshi_detail", "Company");
        map.put("payment", "Company");
        map.put("power", "company");
        map.put("shezhi", "Company");
        map.put("student", "Company");
        map.put("teacher", "Company");
        map.put("teacherinfo", "company");
        return map;
    }

    /**
     * 获取指定公司所有表的数据大小
     */
    @GetMapping("/getCompanyTableSizes")
    @ResponseBody
    public Map<String, Object> getCompanyTableSizes(@RequestParam String companyName) {
        Map<String, Object> result = new HashMap<>();
        try {
            String[] tableNames = {
                    "course", "income", "kaoqin",
                    "keshi_detail", "payment", "power",
                    "shezhi", "student", "teacher","teacherinfo"
            };

            Map<String, String> columnMap = getCompanyColumnMap();
            List<Map<String, Object>> tableSizes = new ArrayList<>();
            long totalSizeKB = 0;

            for (String tableName : tableNames) {
                Map<String, Object> tableInfo = new HashMap<>();
                tableInfo.put("tableName", tableName);

                try {
                    String companyColumn = columnMap.get(tableName);
                    if (companyColumn == null) {
                        tableInfo.put("error", "未配置公司字段映射");
                        tableSizes.add(tableInfo);
                        continue;
                    }

                    Map<String, Object> companyData = getCompanyTableData(tableName, companyColumn, companyName);
                    long sizeKB = (Long) companyData.get("sizeKB");
                    long rowCount = (Long) companyData.get("rowCount");

                    tableInfo.put("sizeKB", sizeKB);
                    tableInfo.put("sizeMB", sizeKB / 1024.0);
                    tableInfo.put("sizeFormatted", formatSize(sizeKB * 1024));
                    tableInfo.put("rows", rowCount);
                    totalSizeKB += sizeKB;

                } catch (Exception e) {
                    tableInfo.put("error", e.getMessage());
                }
                tableSizes.add(tableInfo);
            }

            result.put("code", 200);
            result.put("msg", "获取成功");
            Map<String, Object> data = new HashMap<>();
            data.put("companyName", companyName);
            data.put("tables", tableSizes);
            data.put("totalSizeKB", totalSizeKB);
            data.put("totalSizeMB", totalSizeKB / 1024.0);
            data.put("totalSizeGB", totalSizeKB / (1024.0 * 1024));
            data.put("totalSizeFormatted", formatSize(totalSizeKB * 1024));
            result.put("data", data);

        } catch (Exception e) {
            result.put("code", -1);
            result.put("msg", "获取失败: " + e.getMessage());
        }
        return result;
    }

    /**
     * 获取表中某个公司的数据大小
     */
    private Map<String, Object> getCompanyTableData(String tableName, String companyColumn, String companyName) {
        Map<String, Object> resultMap = new HashMap<>();

        try {
            String sql = "SELECT " +
                    "    COUNT(*) AS row_count, " +
                    "    ISNULL(ROUND(SUM(DATALENGTH(ISNULL(CAST(" + companyColumn + " AS NVARCHAR(MAX)), ''))) / 1024.0, 2), 0) AS data_size_kb " +
                    "FROM " + tableName + " " +
                    "WHERE " + companyColumn + " = ?";

            Map<String, Object> result = jdbcTemplate.queryForMap(sql, companyName);

            long rowCount = ((Number) result.get("row_count")).longValue();
            long sizeKB = 0;
            Object sizeObj = result.get("data_size_kb");
            if (sizeObj != null) {
                sizeKB = ((Number) sizeObj).longValue();
            }

            resultMap.put("sizeKB", sizeKB);
            resultMap.put("rowCount", rowCount);

        } catch (Exception e) {
            resultMap.put("sizeKB", 0L);
            resultMap.put("rowCount", 0L);
        }

        return resultMap;
    }

    /**
     * 格式化大小
     */
    private String formatSize(long size) {
        if (size <= 0) return "0 B";
        String[] units = {"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
        return String.format("%.2f %s", size / Math.pow(1024, digitGroups), units[digitGroups]);
    }

}
