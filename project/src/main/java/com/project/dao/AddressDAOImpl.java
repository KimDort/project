package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.Criteria;
import com.project.vo.AddressVO;
import com.project.vo.CookVO;

@Repository
public class AddressDAOImpl implements AddressDAO {
	@Inject
	private SqlSession session;

	@Override
	public List<AddressVO> SearchAddress(AddressVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.address.SearchAddress",vo);
	}

}
