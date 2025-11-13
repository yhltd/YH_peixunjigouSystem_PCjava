package com.yhocn.login;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

public class DataSourceSelector {

    /**
     * 设置当前会话的数据源类型
     * @param type 数据源类型，如："mysql", "mssql", "none"
     */
    public static void setDataSourceType(String type) {
        HttpSession session = getSession();
        if (session != null) {
            session.setAttribute("dataSourceType", type);
            System.out.println("Session中设置数据源类型: " + type + ", Session ID: " + session.getId());
        } else {
            System.out.println("警告: 无法获取Session，数据源类型设置失败");
        }
    }

    /**
     * 获取当前会话的数据源类型
     * @return 数据源类型
     */
    public static String getDataSourceType() {
        HttpSession session = getSession();
        String dataSourceType = session != null ? (String) session.getAttribute("dataSourceType") : null;
        System.out.println("从Session获取数据源类型: " + dataSourceType + ", Session ID: " + (session != null ? session.getId() : "null"));
        return dataSourceType;
    }

    /**
     * 清理当前会话的数据源类型
     */
    public static void clear() {
        HttpSession session = getSession();
        if (session != null) {
            session.removeAttribute("dataSourceType");
            System.out.println("清理Session中的数据源类型");
        }
    }

    /**
     * 获取当前HTTP会话
     */
    private static HttpSession getSession() {
        try {
            ServletRequestAttributes attributes = (ServletRequestAttributes)
                    RequestContextHolder.getRequestAttributes();
            return attributes != null ? attributes.getRequest().getSession() : null;
        } catch (Exception e) {
            System.out.println("获取Session异常: " + e.getMessage());
            return null;
        }
    }
}