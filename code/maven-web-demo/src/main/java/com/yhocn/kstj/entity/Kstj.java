package com.yhocn.kstj.entity;

public class Kstj {

	private Integer id;
	private String name;
	private String skks;
	private String mjje;
	private String gzhs;
	private String Company;

	public Kstj() {
		super();
	}

	public Kstj(Integer id, String name, String skks, String mjje,
				String gzhs,String Company) {
		super();
		this.id = id;
		this.name = name;
		this.skks = skks;
		this.mjje = mjje;
		this.gzhs = gzhs;
		this.Company=Company;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSkks() {
		return skks;
	}

	public void setSkks(String skks) {
		this.skks = skks;
	}

	public String getMjje() {
		return mjje;
	}

	public void setMjje(String mjje) {
		this.mjje = mjje;
	}

	public String getGzhs() {
		return gzhs;
	}

	public void setGzhs(String gzhs) {
		this.gzhs = gzhs;
	}

	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		this.Company = company;
	}

	@Override
	public String toString() {
		return "kstj [id=" + id + ", name=" + name + ", skks=" + skks + ", mjje=" + mjje
				+ ", gzhs=" + gzhs + ", Company=" + Company +"]";
	}


}