package com.yhocn.keshi_detail.entity;

/**
 * @author wanghui
 * @date 2021/07/12 18:05
 */
public class Keshidetail {
    private Integer id;
    private String riqi;
    private String student_name;
    private String course;
    private Integer keshi;
    private String teacher_name;
    public Double jine;
    public Double gongzi;
    private String Company;

    public Keshidetail() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Keshidetail(Integer id, String riqi, String student_name, String course, Integer keshi, String teacher_name, Double jine, Double gongzi,String Company) {
        this.id = id;
        this.riqi = riqi;
        this.student_name = student_name;
        this.course = course;
        this.keshi = keshi;
        this.teacher_name = teacher_name;
        this.jine = jine;
        this.gongzi = gongzi;
        this.Company=Company;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRiqi() {
        return riqi;
    }

    public void setRiqi(String riqi) {
        this.riqi = riqi;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Integer getKeshi() {
        return keshi;
    }

    public void setKeshi(Integer keshi) {
        this.keshi = keshi;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public Double getJine() {
        return jine;
    }

    public void setJine(Double jine) {
        this.jine = jine;
    }

    public Double getGongzi() {
        return gongzi;
    }

    public void setGongzi(Double gongzi) {
        this.gongzi = gongzi;
    }

    public String getCompany() { return Company; }

    public void setCompany(String company) { this.Company = company; }

    @Override
    public String toString() {
        return "Keshidetail{" +
                "id=" + id +
                ", riqi='" + riqi + '\'' +
                ", student_name='" + student_name + '\'' +
                ", course='" + course + '\'' +
                ", keshi=" + keshi +
                ", teacher_name='" + teacher_name + '\'' +
                ", jine=" + jine +
                ", gongzi=" + gongzi +
                ", Company=" + Company +
                '}';
    }
}
