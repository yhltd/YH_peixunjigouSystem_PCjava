package com.yhocn.income.entity;

public class Income {

	private Integer id;
	private String rgdate;
	private Integer money;
	private String msort;
	private String mremark;
	private Integer paid;
	private String psort;
	private String premark;
	private String handle;
	private String Company;
	
	private Integer mall;
	private Integer pall;
	private Integer xall;
	private Integer yall;
	private Integer d;
	
	public Income() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Income(Integer id, String rgdate, Integer money, String msort, String mremark, Integer paid, String psort,
			String premark, String handle, Integer mall, Integer pall, Integer xall, Integer yall,String Company,Integer d) {
		super();
		this.id = id;
		this.rgdate = rgdate;
		this.money = money;
		this.msort = msort;
		this.mremark = mremark;
		this.paid = paid;
		this.psort = psort;
		this.premark = premark;
		this.handle = handle;
		this.Company=Company;
		this.mall = mall;
		this.pall = pall;
		this.xall = xall;
		this.yall = yall;
		this.d= d;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRgdate() {
		return rgdate;
	}

	public void setRgdate(String rgdate) {
		this.rgdate = rgdate;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getMsort() {
		return msort;
	}

	public void setMsort(String msort) {
		this.msort = msort;
	}

	public String getMremark() {
		return mremark;
	}

	public void setMremark(String mremark) {
		this.mremark = mremark;
	}

	public Integer getPaid() {
		return paid;
	}

	public void setPaid(Integer paid) {
		this.paid = paid;
	}

	public String getPsort() {
		return psort;
	}

	public void setPsort(String psort) {
		this.psort = psort;
	}

	public String getPremark() {
		return premark;
	}

	public void setPremark(String premark) {
		this.premark = premark;
	}

	public String getHandle() {
		return handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public Integer getMall() {
		return mall;
	}

	public void setMall(Integer mall) {
		this.mall = mall;
	}

	public Integer getPall() {
		return pall;
	}

	public void setPall(Integer pall) {
		this.pall = pall;
	}

	public Integer getXall() {
		return xall;
	}

	public void setXall(Integer xall) {
		this.xall = xall;
	}

	public Integer getYall() {
		return yall;
	}

	public void setYall(Integer yall) {
		this.yall = yall;
	}

	public String getCompany() { return Company; }

	public void setCompany(String company) { this.Company = company; }

	public Integer getD() {
		return d;
	}

	public void setD(Integer d) {
		this.d = d;
	}

	@Override
	public String toString() {
		return "Income [id=" + id + ", rgdate=" + rgdate + ", money=" + money + ", msort=" + msort + ", mremark="
				+ mremark + ", paid=" + paid + ", psort=" + psort + ", premark=" + premark + ", handle=" + handle
				+ ", mall=" + mall + ", pall=" + pall + ", xall=" + xall + ", yall=" + yall + ", Company=" + Company +", d=" + d +"]";
	}

	
}
