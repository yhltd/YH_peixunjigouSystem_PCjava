package com.yhocn.course.entity;

/**
 * @author hui
 * @date 2022/9/7 16:17
 */
public class Course {
    private Integer id;
    private String teacher;
    private String course;
    private String riqi;
    private String xingqi;
    private String company;

    public Course(Integer id, String teacher, String course, String riqi, String xingqi, String company) {
        this.id = id;
        this.teacher = teacher;
        this.course = course;
        this.riqi = riqi;
        this.xingqi = xingqi;
        this.company = company;
    }

    public Course() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getRiqi() {
        return riqi;
    }

    public void setRiqi(String riqi) {
        this.riqi = riqi;
    }

    public String getXingqi() {
        return xingqi;
    }

    public void setXingqi(String xingqi) {
        this.xingqi = xingqi;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", teacher='" + teacher + '\'' +
                ", course='" + course + '\'' +
                ", riqi='" + riqi + '\'' +
                ", xingqi='" + xingqi + '\'' +
                ", company='" + company + '\'' +
                '}';
    }
}
