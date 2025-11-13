package com.yhocn.teacherInfo.entity;

/**
 * @author hui
 * @date 2022/8/27 11:49
 */
public class TeacherInfo {
    private Integer id;
    private String t_name;
    private String sex;
    private String id_code;
    private String minzu;
    private String birthday;
    private String post;
    private String education;
    private String phone;
    private String rz_riqi;
    private String state;
    private String shebao;
    private String address;
    private String company;

    public TeacherInfo() {
    }

    public TeacherInfo(Integer id, String t_name, String sex, String id_code, String minzu, String birthday, String post, String education, String phone, String rz_riqi, String state, String shebao, String address, String company) {
        this.id = id;
        this.t_name = t_name;
        this.sex = sex;
        this.id_code = id_code;
        this.minzu = minzu;
        this.birthday = birthday;
        this.post = post;
        this.education = education;
        this.phone = phone;
        this.rz_riqi = rz_riqi;
        this.state = state;
        this.shebao = shebao;
        this.address = address;
        this.company = company;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getId_code() {
        return id_code;
    }

    public void setId_code(String id_code) {
        this.id_code = id_code;
    }

    public String getMinzu() {
        return minzu;
    }

    public void setMinzu(String minzu) {
        this.minzu = minzu;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRz_riqi() {
        return rz_riqi;
    }

    public void setRz_riqi(String rz_riqi) {
        this.rz_riqi = rz_riqi;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getShebao() {
        return shebao;
    }

    public void setShebao(String shebao) {
        this.shebao = shebao;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "TeacherInfo{" +
                "id=" + id +
                ", t_name='" + t_name + '\'' +
                ", sex='" + sex + '\'' +
                ", id_code='" + id_code + '\'' +
                ", minzu='" + minzu + '\'' +
                ", birthday='" + birthday + '\'' +
                ", post='" + post + '\'' +
                ", education='" + education + '\'' +
                ", phone='" + phone + '\'' +
                ", rz_riqi='" + rz_riqi + '\'' +
                ", state='" + state + '\'' +
                ", shebao='" + shebao + '\'' +
                ", address='" + address + '\'' +
                ", company='" + company + '\'' +
                '}';
    }
}
