package com.yhocn.jiami.eneity;

public class jiami {

	private Integer _id;
	private String name;
	private String starttime;
	private String endtime;
	private String soft_name;
	private String denglushijian;
	private String password;
	private String pid;
	private String mark1;
	private String mark2;
	private String mark3;
	private String mark4;
	private String mark5;

	public jiami() {
		super();
		// TODO Auto-generated constructor stub
	}

	public jiami(Integer _id, String name, String starttime, String endtime, String soft_name, String denglushijian, String password, String pid, String mark1, String mark2, String mark3, String mark4, String mark5) {
		this._id = _id;
		this.name = name;
		this.starttime = starttime;
		this.endtime = endtime;
		this.soft_name = soft_name;
		this.denglushijian = denglushijian;
		this.password = password;
		this.pid = pid;
		this.mark1 = mark1;
		this.mark2 = mark2;
		this.mark3 = mark3;
		this.mark4 = mark4;
		this.mark5 = mark5;
	}

	@Override
	public String toString() {
		return "jiami{" +
				"_id=" + _id +
				", name='" + name + '\'' +
				", starttime='" + starttime + '\'' +
				", endtime='" + endtime + '\'' +
				", soft_name='" + soft_name + '\'' +
				", denglushijian='" + denglushijian + '\'' +
				", password='" + password + '\'' +
				", pid='" + pid + '\'' +
				", mark1='" + mark1 + '\'' +
				", mark2='" + mark2 + '\'' +
				", mark3='" + mark3 + '\'' +
				", mark4='" + mark4 + '\'' +
				", mark5='" + mark5 + '\'' +
				'}';
	}

	public Integer get_id() {
		return _id;
	}

	public void set_id(Integer _id) {
		this._id = _id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getSoft_name() {
		return soft_name;
	}

	public void setSoft_name(String soft_name) {
		this.soft_name = soft_name;
	}

	public String getDenglushijian() {
		return denglushijian;
	}

	public void setDenglushijian(String denglushijian) {
		this.denglushijian = denglushijian;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getMark1() {
		return mark1;
	}

	public void setMark1(String mark1) {
		this.mark1 = mark1;
	}

	public String getMark2() {
		return mark2;
	}

	public void setMark2(String mark2) {
		this.mark2 = mark2;
	}

	public String getMark3() {
		return mark3;
	}

	public void setMark3(String mark3) {
		this.mark3 = mark3;
	}

	public String getMark4() {
		return mark4;
	}

	public void setMark4(String mark4) {
		this.mark4 = mark4;
	}

	public String getMark5() {
		return mark5;
	}

	public void setMark5(String mark5) {
		this.mark5 = mark5;
	}


}
