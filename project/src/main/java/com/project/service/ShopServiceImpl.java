package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.ShopDAO;
import com.project.tool.Criteria;
import com.project.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {
	@Inject
	private ShopDAO dao;

	@Override
	public int regisertShop(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertShop(vo);
	}

	@Override
	public List<ShopVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public ShopVO read(int sno) throws Exception {
		// TODO Auto-generated method stub
		return dao.listOne(sno);
	}

	@Override
	public String FileSelect(int sno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFile(sno);
	}

	@Override
	public List<ShopVO> listStrong() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectStrong();
	}

	@Override
	public List<ShopVO> indexList() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainList();
	}

	@Override
	public List<ShopVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.allList();
	}

	@Override
	public int checkDisplay(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.displayCheck(vo);
	}

	@Override
	public int checkStrong(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.strongCheck(vo);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return dao.maxNum();
	}

	@Override
	public int delete(int sno) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(sno);
	}

	@Override
	public int modify(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.modify(vo);
	}

	@Override
	public int checkClosed(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.closedCheck(vo);
	}

	@Override
	public int checkDeleted(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.deletedCheck(vo);
	}

	@Override
	public int checkSale(ShopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.saleCheck(vo);
	}

	@Override
	public List<ShopVO> selectSale() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSale();
	}
}
