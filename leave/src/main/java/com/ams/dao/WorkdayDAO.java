package com.ams.dao;
import com.ams.dto.WorkdaysDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ams.dto.DTO;

import leave.connectivity;

public class WorkdayDAO implements DAO {

	@Override
	public int delete(DTO dto) throws Exception {
		Connection con=connectivity.getConnection();
		WorkdaysDTO workdaysDTO=(WorkdaysDTO)dto;
		
		String StrQuery="delete from workingdays where year=? and month=?";
        PreparedStatement stmt=con.prepareStatement(StrQuery);
        stmt.setInt(1,workdaysDTO.getYear());
        stmt.setString(2,workdaysDTO.getMonth());
         int rs=stmt.executeUpdate();
		
		
		return rs;
	}

	@Override
	public int insert(DTO dto) throws Exception {
		WorkdaysDTO adto=(WorkdaysDTO) dto;
		Connection con=connectivity.getConnection();
		String StrQuery="insert into workingdays values(?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(StrQuery);
		stmt.setInt(1, adto.getYear());
		stmt.setString(2, adto.getMonth());
		stmt.setInt(3, adto.getWorkdays());
		int result=stmt.executeUpdate();
		return result;
	}

	@Override
	public int update(DTO dto) throws Exception {
		
		return 0;
	}

}
