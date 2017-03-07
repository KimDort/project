package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CtgroupDAO;
import com.project.vo.CtgroupVO;

@Service
public class CtgroupServiceImpl implements CtgroupService{

	@Inject
	private CtgroupDAO dao;
	
	@Override
	public List<CtgroupVO> AllList() throws Exception {
		// TODO Auto-generated method stub
		return dao.AllList();
	}

	@Override
	public CtgroupVO OneList(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return dao.OneList(ctgroup);
	}

}
