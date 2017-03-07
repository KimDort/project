package com.project.dao;

import java.util.List;

import com.project.vo.AddressVO;

public interface AddressDAO {
	public List<AddressVO> SearchAddress(AddressVO vo)throws Exception;
}
