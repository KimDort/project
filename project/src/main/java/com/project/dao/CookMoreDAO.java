package com.project.dao;

import java.util.List;

import com.project.vo.CookMoreThingVO;

public interface CookMoreDAO {
	public int createMore(CookMoreThingVO vo)throws Exception;
	public int max()throws Exception;
	public List<CookMoreThingVO> list(int cno)throws Exception;
	public int delete(int cno)throws Exception;
}
