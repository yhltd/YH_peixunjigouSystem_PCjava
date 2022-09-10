package com.yhocn.power.entity;

/**
 * @author hui
 * @date 2022/9/9 18:03
 */
public class Power {
    private Integer id;
    private Integer t_id;
    private String view_name;
    private String add;
    private String del;
    private String upd;
    private String sel;
    private String company;
    private String s_name;

    public Power(Integer id, Integer t_id, String view_name, String add, String del, String upd, String sel, String company, String s_name) {
        this.id = id;
        this.t_id = t_id;
        this.view_name = view_name;
        this.add = add;
        this.del = del;
        this.upd = upd;
        this.sel = sel;
        this.company = company;
        this.s_name = s_name;
    }

    public Power() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    public String getView_name() {
        return view_name;
    }

    public void setView_name(String view_name) {
        this.view_name = view_name;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    public String getUpd() {
        return upd;
    }

    public void setUpd(String upd) {
        this.upd = upd;
    }

    public String getSel() {
        return sel;
    }

    public void setSel(String sel) {
        this.sel = sel;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    @Override
    public String toString() {
        return "Power{" +
                "id=" + id +
                ", t_id=" + t_id +
                ", view_name='" + view_name + '\'' +
                ", add='" + add + '\'' +
                ", del='" + del + '\'' +
                ", upd='" + upd + '\'' +
                ", sel='" + sel + '\'' +
                ", company='" + company + '\'' +
                ", s_name='" + s_name + '\'' +
                '}';
    }
}
