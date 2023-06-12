package com.ams.dao;

import java.sql.Connection;

import com.ams.dto.DTO;

import leave.connectivity;

public class HolidayDAO implements DAO {


	@Override
	public int insert(DTO dto) throws Exception {
		
		Connection con=connectivity.getConnection();
		
		
		return 0;
	}

	@Override
	public int update(DTO dto) throws Exception {
		
		return 0;
	}

	@Override
	public int delete(DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
