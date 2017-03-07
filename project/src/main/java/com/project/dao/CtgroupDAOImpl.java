package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.CtgroupVO;

@Repository
public class CtgroupDAOImpl implements CtgroupDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<CtgroupVO> AllList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.ctgroup.alllist");
	}

	@Override
	public CtgroupVO OneList(int ctgroup) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.ctgroup.onelist",ctgroup);
	}

}
