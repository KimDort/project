package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.CategoryDAO;
import com.project.vo.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Inject
	private CategoryDAO dao;
	@Override
	public List<CategoryVO> AllList() throws Exception {
		// TODO Auto-generated method stub
		return dao.AllList();
	}

	@Override
	public CategoryVO OneList(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.OneList(vo);
	}

}
