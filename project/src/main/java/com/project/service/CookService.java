package com.project.service;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.CookVO;

public interface CookService {
  public int regisertCook(CookVO vo)throws Exception;
  public List<CookVO> list(Criteria cri)throws Exception;
  public int listCountPaging(Criteria cri)throws Exception;
  public CookVO read(int cno)throws Exception;
  public String FileSelect(int cno)throws Exception;
  public List<CookVO> listStrong()throws Exception;
  public List<CookVO> indexList()throws Exception;
  public List<CookVO> listAll()throws Exception;
  public int checkDisplay(CookVO vo)throws Exception;
  public int checkStrong(CookVO vo)throws Exception;
  public int checkClosed(CookVO vo) throws Exception;
  public int checkDeleted(CookVO vo)throws Exception;
  public int checkSale(CookVO vo)throws Exception;
  public int maxNum()throws Exception;
  public int delete(int cno)throws Exception;
  public int modify(CookVO vo)throws Exception;
  public List<CookVO> selectSale()throws Exception;
}
