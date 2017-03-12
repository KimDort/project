package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.Criteria;
import com.project.vo.ShopVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	@Inject
	private SqlSession session;

	@Override
	public int insertShop(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.shop.insertShop", vo);
	}

	@Override
	public List<ShopVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shop.listPage", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.shop.countPaging", cri);
	}

	@Override
	public ShopVO listOne(int sno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.shop.read", sno);
	}

	@Override
	public String selectFile(int sno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.shop.selectFile", sno);
	}

	@Override
	public List<ShopVO> selectStrong() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shop.selectStrong");
	}

	@Override
	public List<ShopVO> mainList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shop.mainList");
	}

	@Override
	public List<ShopVO> allList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shop.allList");
	}

	@Override
	public int displayCheck(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.display", vo);
	}

	@Override
	public int strongCheck(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.strong", vo);
	}

	@Override
	public int closedCheck(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.closed", vo);
	}

	@Override
	public int deletedCheck(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.deleted", vo);
	}

	@Override
	public int saleCheck(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.sale", vo);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.shop.maxNum");
	}

	@Override
	public int delete(int sno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.shop.ShopDelete",sno);
	}

	@Override
	public int modify(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.shop.ShopUpdate",vo);
	}

	@Override
	public List<ShopVO> selectSale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.shop.selectSale");
	}
	
	
}
