package com.ams.dto;

import java.sql.Date;

public class HolidayDTO implements DTO {
	Date HolidayDate;
	String HolidayName;
	public Date getHolidayDate() {
		return HolidayDate;
	}
	public void setHolidayDate(Date holidayDate) {
		HolidayDate = holidayDate;
	}
	public String getHolidayName() {
		return HolidayName;
	}
	public void setHolidayName(String holidayName) {
		HolidayName = holidayName;
	}
	public HolidayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HolidayDTO(Date holidayDate, String holidayName) {
		super();
		HolidayDate = holidayDate;
		HolidayName = holidayName;
	}
	@Override
	public String toString() {
		return "HolidayDTO [HolidayDate=" + HolidayDate + ", HolidayName=" + HolidayName + "]";
	}
	
	
}
