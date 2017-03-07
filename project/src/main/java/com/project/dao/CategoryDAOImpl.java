package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	@Inject
	private SqlSession session;
	
	@Override
	public List<CategoryVO> AllList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.category.alllist");
	}

	@Override
	public CategoryVO OneList(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.category.onelist",vo);
	}

}
