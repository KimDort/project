package com.project.dao;

import java.util.List;

import com.project.tool.SearchCriteria;
import com.project.vo.EventVO;

import jdk.nashorn.internal.runtime.ECMAErrors;

public interface EventDAO {
  public int insertEvent(EventVO vo)throws Exception;
  public int maxNum()throws Exception;
  public List<EventVO> listAll()throws Exception;
  public List<EventVO> selectBanner()throws Exception;
  public List<EventVO> pageList(SearchCriteria cri)throws Exception;
  public EventVO read(int eno)throws Exception;
  public int eventDelete(int eno)throws Exception;
  public int checkString(EventVO vo)throws Exception;
  public int checkClosed(EventVO vo)throws Exception;
  public int checkDeleted(EventVO vo)throws Exception;
  public int checkBanner(EventVO vo)throws Exception;
  public int checkQuit(EventVO vo)throws Exception;
  public int checkDisplay(EventVO vo)throws Exception;
  public int countPaging()throws Exception;
  public int modify(EventVO vo)throws Exception;
}
