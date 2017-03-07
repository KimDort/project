package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.CookMoreThingVO;

@Repository
public class CookMoreDAOImpl implements CookMoreDAO{
	@Inject
	private SqlSession session;
	
	@Override
	public int createMore(CookMoreThingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.cookmore.insertCookmore",vo);
	}

	@Override
	public int max() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.cookmore.selectcno");
	}

	@Override
	public List<CookMoreThingVO> list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cookmore.selectlist",cno);
	}

	@Override
	public int delete(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.cookmore.delete",cno);
	}
	
}
