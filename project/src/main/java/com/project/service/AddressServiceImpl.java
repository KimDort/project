package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.AddressDAO;
import com.project.vo.AddressVO;

@Service
public class AddressServiceImpl implements AddressService{
	@Inject
	private AddressDAO dao;

	@Override
	public List<AddressVO> SearchAddress(AddressVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.SearchAddress(vo);
	}

}
