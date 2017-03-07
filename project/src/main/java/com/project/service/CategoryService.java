package com.project.service;

import java.util.List;

import com.project.vo.CategoryVO;

public interface CategoryService {
	public List<CategoryVO> AllList()throws Exception;
	public CategoryVO OneList(CategoryVO vo)throws Exception;
}
