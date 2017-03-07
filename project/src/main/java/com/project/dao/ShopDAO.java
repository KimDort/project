package com.project.dao;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.ShopVO;

public interface ShopDAO {
	public int insertShop(ShopVO vo) throws Exception;

	public ShopVO listOne(int sno) throws Exception;

	public List<ShopVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public String selectFile(int sno) throws Exception;

	public List<ShopVO> selectStrong() throws Exception;

	public List<ShopVO> mainList() throws Exception;

	public List<ShopVO> allList() throws Exception;

	public int displayCheck(ShopVO vo) throws Exception;

	public int strongCheck(ShopVO vo) throws Exception;
	
	public int closedCheck(ShopVO vo) throws Exception;
	
	public int deletedCheck(ShopVO vo)throws Exception;
	
	public int saleCheck(ShopVO vo)throws Exception;

	public int maxNum() throws Exception;
	
	public int delete(int sno)throws Exception;
	
	public int modify(ShopVO vo)throws Exception;
}