package com.yhocn.pushnews.entity;

import java.util.Date;

public class PushNews {

    private Integer _id;
    private String gsname;
    private String xtname;
    private String tpname1;
    private String tptop1;
    private String tpname2;
    private String tptop2;
    private String tpname3;
    private String tptop3;
    private String tpname4;
    private String tptop4;
    private String tpname5;
    private String tptop5;
    private String tpname6;
    private String tptop6;
    private String topkuan;
    private String topgao;
    private String xuankuan;
    private String xuangao;
    private Date date;
    private String textbox;
    private String beizhu1;
    private String beizhu2;
    private String beizhu3;
    private String beizhu4;
    private String beizhu5;
    private String beizhu6;
    private String beizhu7;
    private String beizhu8;
    private String beizhu9;
    private String beizhu10;
    private Date qidate;
    private Date zhidate;

    public PushNews(Integer id,Date qidate ,Date zhidate,String gsname, String xtname, String tpname1,  String tptop1, String tpname2,  String tptop2, String tpname3,  String tptop3, String tpname4,  String tptop4, String tpname5,  String tptop5, String tpname6,  String tptop6, String topkuan, String topgao, String xuankuan, String xuangao,Date date,String textbox,String beizhu1,String beizhu2,String beizhu3,String beizhu4,String beizhu5,String beizhu6,String beizhu7,String beizhu8,String beizhu9,String beizhu10) {
        this._id = id;
        this.gsname = gsname;
        this.xtname = xtname;
        this.tpname1 = tpname1;
        this.tptop1 = tptop1;
        this.tpname2 = tpname2;
        this.tptop2 = tptop2;
        this.tpname3 = tpname3;
        this.tptop3 = tptop3;
        this.tpname4 = tpname4;
        this.tptop4 = tptop4;
        this.tpname5 = tpname5;
        this.tptop5 = tptop5;
        this.tpname6 = tpname6;
        this.tptop6 = tptop6;
        this.topgao = topgao;
        this.topkuan = topkuan;
        this.xuangao =xuangao;
        this.xuankuan = xuankuan;
        this.date = date;
        this.textbox = textbox;
        this.beizhu1 = beizhu1;
        this.beizhu2 = beizhu2;
        this.beizhu3 = beizhu3;
        this.beizhu4 = beizhu4;
        this.beizhu5 = beizhu5;
        this.beizhu6 = beizhu6;
        this.beizhu7 = beizhu7;
        this.beizhu8 = beizhu8;
        this.beizhu9 = beizhu9;
        this.beizhu10 = beizhu10;
        this.qidate = qidate;
        this.zhidate = zhidate;
    }

    public PushNews() {
    }

    public Integer get_id() {return _id;}

    public String getGsname() {
        return gsname;
    }

    public String getXtname() {
        return xtname;
    }

    public String getTpname1() {
        return tpname1;
    }

    public String getTptop1() {
        return tptop1;
    }

    public String getTpname2() {
        return tpname2;
    }

    public String getTptop2() {
        return tptop2;
    }

    public String getTpname3() {
        return tpname3;
    }

    public String getTptop3() {
        return tptop3;
    }

    public String getTpname4() {
        return tpname4;
    }

    public String getTptop4() {
        return tptop4;
    }

    public String getTpname5() {
        return tpname5;
    }

    public String getTptop5() {
        return tptop5;
    }

    public String getTpname6() {
        return tpname6;
    }

    public String getTptop6() {
        return tptop6;
    }

    public String getTopkuan() {
        return topkuan;
    }

    public String getTopgao() {
        return topgao;
    }

    public String getXuankuan() {
        return xuankuan;
    }

    public String getXuangao() {
        return xuangao;
    }

    public String getTextbox() {
        return textbox;
    }

    public String getBeizhu1() {
        return beizhu1;
    }

    public String getBeizhu2() {
        return beizhu2;
    }

    public String getBeizhu3() {
        return beizhu3;
    }

    public String getBeizhu4() {
        return beizhu4;
    }

    public String getBeizhu5() {
        return beizhu5;
    }

    public String getBeizhu6() {
        return beizhu6;
    }

    public String getBeizhu7() {
        return beizhu7;
    }

    public String getBeizhu8() {
        return beizhu8;
    }

    public String getBeizhu9() {
        return beizhu9;
    }

    public String getBeizhu10() {
        return beizhu10;
    }

    public Date getQidate() {
        return qidate;
    }

    public Date getZhidate() {
        return zhidate;
    }
}
