package com.ams.dto;

public class LoginDTO implements DTO{

	private String employee_id;
	private String password;
	private String position;
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "LoginDTO [employee_id=" + employee_id + ", password=" + password + ", position=" + position + "]";
	}
	public LoginDTO(String employee_id, String password, String position) {
		super();
		this.employee_id = employee_id;
		this.password = password;
		this.position = position;
	}
	public LoginDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
