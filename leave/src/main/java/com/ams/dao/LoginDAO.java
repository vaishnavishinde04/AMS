package com.ams.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ams.dto.DTO;
import com.ams.dto.LoginDTO;

import leave.connectivity;

public class LoginDAO implements DAO{

	public int delete(DTO dto) throws Exception{
		
		LoginDTO ldto=(LoginDTO)dto;
		String strQuery="delete from employee where employee_id=?";
		Connection con=connectivity.getConnection();
		PreparedStatement stmt=con.prepareStatement(strQuery);
		stmt.setString(1,ldto.getEmployee_id());
		int result=stmt.executeUpdate();
		
		return result;
	}

	
	public int insert(DTO dto) throws Exception {
		
		LoginDTO adto = (LoginDTO) dto;
		String StrQuery="insert into employee values(?,?,?)";
		Connection con=connectivity.getConnection();
		PreparedStatement stmt=con.prepareStatement(StrQuery);
		stmt.setString(1,adto.getEmployee_id());
		stmt.setString(2,adto.getPassword());
		stmt.setString(3, adto.getPosition());
		
		int result=stmt.executeUpdate();
		
		return result;
	}


	public int update(DTO dto) throws Exception {
		
		LoginDTO adto = (LoginDTO) dto;
		String StrQuery="update employee set password=?,position=? where employee_id=?";
		Connection con=connectivity.getConnection();
		PreparedStatement stmt=con.prepareStatement(StrQuery);
		stmt.setString(3,adto.getEmployee_id());
		stmt.setString(1,adto.getPassword());
		stmt.setString(2, adto.getPosition());
		
		int result=stmt.executeUpdate();
		
		return result;
		
	}
	
	public List<DTO> reteriveall() throws Exception
	{
		List<DTO> dtolst = new ArrayList<DTO>();
		LoginDTO dto = new LoginDTO();
		
		String StrQuery="select * from employee";
		Connection con=connectivity.getConnection();
		
		PreparedStatement stmt=con.prepareStatement(StrQuery);
		ResultSet rs = stmt.executeQuery();
	 	 
	 	
	    
	    while(rs.next()) {
	    	
	    	dto = new LoginDTO();
	    	dto.setEmployee_id(rs.getString(1));
	    	dto.setPassword(rs.getString(2));
	    	dto.setPosition(rs.getString(3));
	    	
	    	dtolst.add(dto);
	    	
	    }
		
		return dtolst;
		
	}
	
	
	
	

}
