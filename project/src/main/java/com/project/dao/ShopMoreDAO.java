package com.project.dao;

import java.util.List;

import com.project.vo.ShopMoreThingVO;
import com.project.vo.ThingVO;

public interface ShopMoreDAO {
	public int create(ShopMoreThingVO vo)throws Exception;
	public int max()throws Exception;
	public List<ThingVO> selectone(int sno)throws Exception;
}
