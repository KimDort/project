package com.project.service;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.ShopVO;

public interface ShopService {
	public int regisertShop(ShopVO vo) throws Exception;

	public List<ShopVO> list(Criteria cri) throws Exception;

	public int listCountPaging(Criteria cri) throws Exception;

	public ShopVO read(int sno) throws Exception;

	public String FileSelect(int sno) throws Exception;

	public List<ShopVO> listStrong() throws Exception;

	public List<ShopVO> indexList() throws Exception;

	public List<ShopVO> listAll() throws Exception;

	public int checkDisplay(ShopVO vo) throws Exception;

	public int checkStrong(ShopVO vo) throws Exception;

	public int checkClosed(ShopVO vo) throws Exception;

	public int checkDeleted(ShopVO vo) throws Exception;

	public int checkSale(ShopVO vo) throws Exception;

	public int maxNum() throws Exception;

	public int delete(int sno) throws Exception;

	public int modify(ShopVO vo) throws Exception;

	public List<ShopVO> selectSale() throws Exception;
}
