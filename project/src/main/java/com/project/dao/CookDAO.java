package com.project.dao;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.CookVO;

public interface CookDAO {
	public int insertCook(CookVO vo) throws Exception;

	public CookVO listOne(int cno) throws Exception;

	public List<CookVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public String selectFile(int cno) throws Exception;

	public List<CookVO> selectStrong() throws Exception;

	public List<CookVO> mainList() throws Exception;

	public List<CookVO> allList() throws Exception;

	public int displayCheck(CookVO vo) throws Exception;

	public int strongCheck(CookVO vo) throws Exception;
	
	public int closedCheck(CookVO vo) throws Exception;
	
	public int deletedCheck(CookVO vo)throws Exception;
	
	public int saleCheck(CookVO vo)throws Exception;

	public int maxNum() throws Exception;
	
	public int delete(int cno)throws Exception;
	
	public int modify(CookVO vo)throws Exception;
}
