package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.ShopMoreThingVO;
import com.project.vo.ThingVO;

@Repository
public class ShopMoreDAOImpl implements ShopMoreDAO{
	@Inject
	private SqlSession session;
	@Override
	public int create(ShopMoreThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.shopmore.insertShopmore",vo);
	}
	@Override
	public int max() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.shopmore.selectsno");
	}
	@Override
	public List<ThingVO> selectone(int sno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shopmore.selectone",sno);
	}

}
