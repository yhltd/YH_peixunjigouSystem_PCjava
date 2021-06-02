package com.yhocn.teacher.entity;

public class Teacher {

	private Integer id;
	private String userName;
	private String password;
	private String realName;
	private Integer useType;
	private Integer age;
	private Integer phone;
	private String home;
	private String photo;
	private String education;
	
	public Teacher() {
		super();
	}

	public Teacher(Integer id, String userName, String password, String realName, Integer useType, Integer age,
			Integer phone, String home, String photo, String education) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.useType = useType;
		this.age = age;
		this.phone = phone;
		this.home = home;
		this.photo = photo;
		this.education = education;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getUseType() {
		return useType;
	}

	public void setUseType(Integer useType) {
		this.useType = useType;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", userName=" + userName + ", password=" + password + ", realName=" + realName
				+ ", useType=" + useType + ", age=" + age + ", phone=" + phone + ", home=" + home + ", photo=" + photo
				+ ", education=" + education + "]";
	}
	
	
}