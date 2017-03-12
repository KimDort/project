package com.project.dao;

import java.util.List;

import com.project.tool.Criteria;
import com.project.vo.NoticeVO;

public interface NoticeDAO {
  public int insertNotice(NoticeVO vo)throws Exception;
  public NoticeVO listOne(int nno)throws Exception;
  public List<NoticeVO> listCriteria(Criteria cri)throws Exception;
  public int countPaging(Criteria cri)throws Exception;
  public String selectFile(int nno)throws Exception;
  public List<NoticeVO> selectStrong()throws Exception;
  public List<NoticeVO> mainList()throws Exception;
  public List<NoticeVO> allList()throws Exception; 
  public int displayCheck(NoticeVO vo)throws Exception;
  public int strongCheck(NoticeVO vo)throws Exception;
  public int closedCheck(NoticeVO vo)throws Exception;
  public int deletedCheck(NoticeVO vo)throws Exception;
  public int maxNum()throws Exception;
  public int modify(NoticeVO vo)throws Exception;
  public int delete(int nno)throws Exception;
}
