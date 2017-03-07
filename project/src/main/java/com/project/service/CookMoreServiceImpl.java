package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CookMoreDAO;
import com.project.vo.CookMoreThingVO;

@Service
public class CookMoreServiceImpl implements CookMoreService{
	@Inject
	private CookMoreDAO dao;

	@Override
	public int register(CookMoreThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.createMore(vo);
	}

	@Override
	public int max() throws Exception {
		// TODO Auto-generated method stub
		return dao.max();
	}

	@Override
	public List<CookMoreThingVO> list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(cno);
	}

	@Override
	public int delete(int cno) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(cno);
	}
}
