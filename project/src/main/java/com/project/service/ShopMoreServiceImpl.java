package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ShopMoreDAO;
import com.project.vo.ShopMoreThingVO;
import com.project.vo.ThingVO;

@Service
public class ShopMoreServiceImpl implements ShopMoreService{
	@Inject
	private ShopMoreDAO dao;

	@Override
	public int register(ShopMoreThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.create(vo);
	}

	@Override
	public int max() throws Exception {
		// TODO Auto-generated method stub
		return dao.max();
	}

	@Override
	public List<ThingVO> selectone(int sno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectone(sno);
	}

}
