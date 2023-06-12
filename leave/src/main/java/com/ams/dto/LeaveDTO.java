package com.ams.dto;

import java.sql.Date;

public class LeaveDTO implements DTO {
	String Employee_id;
	Date Fromd;
	Date Tod;
	String Leave_desc;
	String Leave_id;
	String LeaveType;
	String Status;
	public String getEmployee_id() {
		return Employee_id;
	}
	public void setEmployee_id(String employee_id) {
		Employee_id = employee_id;
	}
	public Date getFromd() {
		return Fromd;
	}
	public void setFromd(Date fromd) {
		Fromd = fromd;
	}
	public Date getTod() {
		return Tod;
	}
	public void setTod(Date tod) {
		Tod = tod;
	}
	public String getLeave_desc() {
		return Leave_desc;
	}
	public void setLeave_desc(String leave_desc) {
		Leave_desc = leave_desc;
	}
	public String getLeave_id() {
		return Leave_id;
	}
	public void setLeave_id(String leave_id) {
		Leave_id = leave_id;
	}
	public String getLeaveType() {
		return LeaveType;
	}
	public void setLeaveType(String leaveType) {
		LeaveType = leaveType;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	public LeaveDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LeaveDTO(String employee_id, Date fromd, Date tod, String leave_desc, String leave_id, String leaveType,
			String status) {
		super();
		Employee_id = employee_id;
		Fromd = fromd;
		Tod = tod;
		Leave_desc = leave_desc;
		Leave_id = leave_id;
		LeaveType = leaveType;
		Status = status;
	}
	@Override
	public String toString() {
		return "LeaveDTO [Employee_id=" + Employee_id + ", Fromd=" + Fromd + ", Tod=" + Tod + ", Leave_desc="
				+ Leave_desc + ", Leave_id=" + Leave_id + ", LeaveType=" + LeaveType + ", status=" + Status + "]";
	}
	
	
	
}
