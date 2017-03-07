package com.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.ShopOrderCompleteVO;

@Repository
public class ShopOrderDAOImpl implements ShopOrderDAO{
	@Inject
	private SqlSession session;
	
	
	@Override
	public int register(ShopOrderCompleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.shop.insertOrder",vo);
	}

}
