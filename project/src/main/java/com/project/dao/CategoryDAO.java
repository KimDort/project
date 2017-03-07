package com.project.dao;

import java.util.List;

import com.project.vo.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> AllList()throws Exception;
	public CategoryVO OneList(CategoryVO vo)throws Exception;
}
