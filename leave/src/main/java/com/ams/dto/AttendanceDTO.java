package com.ams.dto;

public class AttendanceDTO implements DTO {
	int year;
	String month;
	String employeeID;
	int attendance;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	@Override
	public String toString() {
		return "AttendanceDTO [year=" + year + ", month=" + month + ", employeeID=" + employeeID + ", attendance="
				+ attendance + "]";
	}

	public AttendanceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AttendanceDTO(int year, String month, String employeeID, int attendance) {
		super();
		this.year = year;
		this.month = month;
		this.employeeID = employeeID;
		this.attendance = attendance;
	}

}
