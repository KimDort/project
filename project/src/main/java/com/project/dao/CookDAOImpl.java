package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.Criteria;
import com.project.vo.CookVO;

@Repository
public class CookDAOImpl implements CookDAO {
	@Inject
	private SqlSession session;

	@Override
	public int insertCook(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.cook.insertCook", vo);
	}

	@Override
	public List<CookVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cook.listPage", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.cook.countPaging", cri);
	}

	@Override
	public CookVO listOne(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.cook.read", cno);
	}

	@Override
	public String selectFile(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.cook.selectFile", cno);
	}

	@Override
	public List<CookVO> selectStrong() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cook.selectStrong");
	}

	@Override
	public List<CookVO> mainList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cook.mainList");
	}

	@Override
	public List<CookVO> allList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cook.allList");
	}

	@Override
	public int displayCheck(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.display", vo);
	}

	@Override
	public int strongCheck(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.strong", vo);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.cook.maxNum");
	}

	@Override
	public int delete(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.cook.CookDelete",cno);
	}

	@Override
	public int modify(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.CookUpdate",vo);
	}

	@Override
	public int closedCheck(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.closed",vo);
	}

	@Override
	public int deletedCheck(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.deleted",vo);
	}

	@Override
	public int saleCheck(CookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.cook.sale",vo);
	}

	@Override
	public List<CookVO> selectSale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.cook.selectSale");
	}
}
