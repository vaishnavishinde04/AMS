package com.ams.dto;

public class WorkdaysDTO implements DTO {
               String Month;
               int Year;
               int Workdays;
			public String getMonth() {
				return Month;
			}
			public void setMonth(String month) {
				Month = month;
			}
			public int getYear() {
				return Year;
			}
			public void setYear(int year) {
				Year = year;
			}
			public int getWorkdays() {
				return Workdays;
			}
			public void setWorkdays(int workdays) {
				Workdays = workdays;
			}
			public WorkdaysDTO(String month, int year, int workdays) {
				super();
				Month = month;
				Year = year;
				Workdays = workdays;
			}
			public WorkdaysDTO() {
				super();
				// TODO Auto-generated constructor stub
			}
			@Override
			public String toString() {
				return "WorkdaysDTO [Month=" + Month + ", Year=" + Year + ", Workdays=" + Workdays + "]";
			}
               
}
