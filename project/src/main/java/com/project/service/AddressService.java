package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.vo.AddressVO;

public interface AddressService {
	public List<AddressVO> SearchAddress(AddressVO vo)throws Exception;
}
