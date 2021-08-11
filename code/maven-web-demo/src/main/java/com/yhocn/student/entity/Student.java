package com.yhocn.student.entity;

public class Student {

	private Integer id;
	private String realName;
	private String sex;
	private String rgdate;
	private String course;
	private String teacher;
	private String classnum;
	private String phone;
	private Integer fee;
	private Integer cost;
	private Integer nocost;
	private Integer hour;
	private Integer nohour;
	private Integer allHour;
	private String type;
	private String Company;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(Integer id, String realName, String sex, String rgdate, String course, String teacher,
			String classnum, String phone, Integer fee, Integer cost, Integer nocost, Integer hour, Integer nohour,
			Integer allHour, String type,String Company) {
		super();
		this.id = id;
		this.realName = realName;
		this.sex = sex;
		this.rgdate = rgdate;
		this.course = course;
		this.teacher = teacher;
		this.classnum = classnum;
		this.phone = phone;
		this.fee = fee;
		this.cost = cost;
		this.nocost = nocost;
		this.hour = hour;
		this.nohour = nohour;
		this.allHour = allHour;
		this.type = type;
		this.Company=Company;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRgdate() {
		return rgdate;
	}

	public void setRgdate(String rgdate) {
		this.rgdate = rgdate;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getClassnum() {
		return classnum;
	}

	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getFee() {
		return fee;
	}

	public void setFee(Integer fee) {
		this.fee = fee;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public Integer getNocost() {
		return nocost;
	}

	public void setNocost(Integer nocost) {
		this.nocost = nocost;
	}

	public Integer getHour() {
		return hour;
	}

	public void setHour(Integer hour) {
		this.hour = hour;
	}

	public Integer getNohour() {
		return nohour;
	}

	public void setNohour(Integer nohour) {
		this.nohour = nohour;
	}

	public Integer getAllHour() {
		return allHour;
	}

	public void setAllHour(Integer allHour) {
		this.allHour = allHour;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCompany(String company) {
		this.Company = company;
	}

	public String getCompany() {
		return Company;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", realName=" + realName + ", sex=" + sex + ", rgdate=" + rgdate + ", course="
				+ course + ", teacher=" + teacher + ", classnum=" + classnum + ", phone=" + phone + ", fee=" + fee
				+ ", cost=" + cost + ", nocost=" + nocost + ", hour=" + hour + ", nohour=" + nohour + ", allHour="
				+ allHour + ", type=" + type + ", Company=" + Company + "]";
	}

	
}
