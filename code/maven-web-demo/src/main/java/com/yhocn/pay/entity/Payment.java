package com.yhocn.pay.entity;

public class Payment {

	private Integer id;
	private String ksdate;
	private String realname;
	private Integer paid;
	private Integer money;
	private String paiment;
	private String keeper;
	private String remark;
	
	public Payment() {
		super();
	}

	public Payment(Integer id, String ksdate, String realname, Integer paid, Integer money, String paiment,
			String keeper, String remark) {
		super();
		this.id = id;
		this.ksdate = ksdate;
		this.realname = realname;
		this.paid = paid;
		this.money = money;
		this.paiment = paiment;
		this.keeper = keeper;
		this.remark = remark;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKsdate() {
		return ksdate;
	}

	public void setKsdate(String ksdate) {
		this.ksdate = ksdate;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Integer getPaid() {
		return paid;
	}

	public void setPaid(Integer paid) {
		this.paid = paid;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getPaiment() {
		return paiment;
	}

	public void setPaiment(String paiment) {
		this.paiment = paiment;
	}

	public String getKeeper() {
		return keeper;
	}

	public void setKeeper(String keeper) {
		this.keeper = keeper;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", ksdate=" + ksdate + ", realname=" + realname + ", paid=" + paid + ", money="
				+ money + ", paiment=" + paiment + ", keeper=" + keeper + ", remark=" + remark + "]";
	}
	
	
	
	
}
