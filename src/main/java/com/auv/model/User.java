package com.auv.model;

public class User {
	private int id;
	private String name;
	private String password;
	private int age;
	private String deptment;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDeptment() {
		return deptment;
	}
	public void setDeptment(String deptment) {
		this.deptment = deptment;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
