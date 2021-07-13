package com.yhocn.shezhi.entity;

public class Shezhi {

	private Integer id;
	private String course;
	private String teacher;
	private String type;
	private String paiment;
	private String msort;
	private String psort;

	public Shezhi() {
		super();
	}

	public Shezhi(Integer id, String course, String teacher, String type,
				  String paiment, String msort, String psort) {
		super();
		this.id = id;
		this.course = course;
		this.teacher = teacher;
		this.type = type;
		this.paiment = paiment;
		this.msort = msort;
		this.psort = psort;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPaiment() {
		return paiment;
	}

	public void setPaiment(String paiment) {
		this.paiment = paiment;
	}

	public String getMsort() {
		return msort;
	}

	public void setMsort(String msort) {
		this.msort = msort;
	}

	public String getPsort() {
		return psort;
	}

	public void setPsort(String psort) {
		this.psort = psort;
	}

	@Override
	public String toString() {
		return "Shezhi [id=" + id + ", course=" + course + ", teacher=" + teacher + ", type=" + type
				+ ", paiment=" + paiment + ", msort=" + msort + ", psort=" + psort + "]";
	}


}