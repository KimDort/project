package com.project.service;

import java.util.List;

import com.project.vo.ShopMoreThingVO;
import com.project.vo.ThingVO;

public interface ShopMoreService {
	public int register(ShopMoreThingVO vo)throws Exception;
	public int max()throws Exception;
	public List<ThingVO> selectone(int sno)throws Exception;
	public List<ShopMoreThingVO> selectList(int sno)throws Exception;
}
