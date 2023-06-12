package com.ams.dao;

import com.ams.dto.DTO;

public interface DAO {
	
	public int delete(DTO dto) throws Exception;
	public int insert(DTO dto) throws Exception;
	public int update(DTO dto) throws Exception;
	
}
