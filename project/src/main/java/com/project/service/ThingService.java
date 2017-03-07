package com.project.service;

import java.util.List;

import com.project.tool.Criteria;
import com.project.tool.SearchCriteria;
import com.project.vo.CategoryVO;
import com.project.vo.CtgroupVO;
import com.project.vo.ThingVO;

public interface ThingService {
  public int regisertThing(ThingVO vo)throws Exception;
  public List<ThingVO> list(SearchCriteria cri)throws Exception;
  public int listCountPaging(SearchCriteria cri)throws Exception;
  public ThingVO read(int nno)throws Exception;
  public String FileSelect(int nno)throws Exception;
  public List<ThingVO> listAll()throws Exception;
  public List<CtgroupVO> groupList()throws Exception;
  public List<CategoryVO> categoryList(int ctgroup)throws Exception;
  public List<CategoryVO> categoryAllList()throws Exception;
  public int CtgroupInsert(CtgroupVO vo)throws Exception;
  public int CategoryInsert(CategoryVO vo)throws Exception;
  public int CtgroupDelete(int ctgroup)throws Exception;
  public int CategoryDelete(int ctno)throws Exception;
  public int totalCount()throws Exception;
  public List<ThingVO> thingInfo(CategoryVO vo)throws Exception;
  public int modify(ThingVO vo)throws Exception;
  public int delete(int tno)throws Exception;
}
