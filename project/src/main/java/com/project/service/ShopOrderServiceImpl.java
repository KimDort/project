package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ShopOrderDAO;
import com.project.vo.ShopOrderCompleteVO;

@Service
public class ShopOrderServiceImpl implements ShopOrderService{
	
	@Inject
	private ShopOrderDAO dao;
	
	@Override
	public int register(ShopOrderCompleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.register(vo);
	}

}
